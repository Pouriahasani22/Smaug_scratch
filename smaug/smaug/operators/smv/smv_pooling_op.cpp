#include "smaug/core/backend.h"
#include "smaug/operators/common.h"
#include "smaug/operators/smv/smv_pooling_op.h"
#include "smaug/operators/smv/smv_pooling_tiling.h"
#include "smaug/operators/smv/smv_kernels.h"
#include "smaug/utility/debug_stream.h"

namespace smaug {
namespace smv {
namespace pool {

const int kVectorSize = 8;

}  // namespace pool
}  // namespace smv

// This function iterates the tiles generated by the tiling optimizer and send
// inputs/outputs tile duo to the hardware kernel for computation. The tile
// iteration is in the following order:
// 1) N: batch-wise tiles in the inputs.
// 2) H: Rowwise tiles in the inputs.
// 3) W: column-wise tiles in the inputs.
// 4) C: Channelwise tiles in the inputs/weights.
void SmvPoolingOp::runNHWC(TiledTensor& inputs, TiledTensor& outputs) {
    int inputIfmapTiles = inputs.getShape()[0];
    int inputRowTiles = inputs.getShape()[1];
    int inputColTiles = inputs.getShape()[2];
    int inputChanTiles = inputs.getShape()[3];
    int outputChanTiles = outputs.getShape()[3];
    auto inputIdx = inputs.startIndex();
    auto outputIdx = outputs.startIndex();
    setArrayMemTypeIfSimulating(
            smv::kPoolingHw, "host_inputs", getInputsMemType());
    setArrayMemTypeIfSimulating(
            smv::kPoolingHw, "host_results", getOutputsMemType());
    for (int N = 0; N < inputIfmapTiles; N++) {
        for (int H = 0; H < inputRowTiles; H++) {
            for (int W = 0; W < inputColTiles; W++) {
                int iC = 0, oC = 0;
                // This keeps track of the channel offset of the outputs.
                int ofmapOffset = 0;
                while (iC < inputChanTiles && oC < outputChanTiles) {
                    int inputTileIdx = inputIdx(N, H, W, iC);
                    int outputTileIdx = outputIdx(N, H, W, oC);
                    // If the outputs don't need tiling on channels whereas the
                    // inputs need it, the tiling optimizer allows the output
                    // tile to have different number of channels from the input
                    // tile.
                    dout(1) << "Input: " << inputTileIdx
                            << ", output: " << outputTileIdx << "\n";
                    Tensor* inputTile = inputs.getTileWithData(inputTileIdx);
                    Tensor* outputTile = outputs[outputTileIdx];
                    const TensorShape& inputShape = inputTile->getShape();
                    const TensorShape& outputShape = outputTile->getShape();
                    mapArrayToAccel(smv::kPoolingHw, "host_inputs",
                                    inputTile->data<float16>(),
                                    inputShape.storageSize() * sizeof(float16));
                    mapArrayToAccel(
                            smv::kPoolingHw, "host_results",
                            outputTile->data<float16>(),
                            outputShape.storageSize() * sizeof(float16));
                    int inputDims[4] = { inputShape[0], inputShape[1],
                                         inputShape[2], inputShape[3] };
                    int outputDims[4] = { outputShape[0], outputShape[1],
                                          outputShape[2], outputShape[3] };
                    // If the input and output tiles belong to the same channel
                    // group, then their data will be loaded at the same time
                    // into the spads, so we start from the beginning of the
                    // tile. Otherwise, we start from the last place we left off
                    // from.
                    int ofmapStart = (iC == oC) ? 0 : ofmapOffset;

                    std::cout << "inputTileIdx: " << inputTileIdx << ",\t";
                    std::cout << "outputTileIdx: " << outputTileIdx << std::endl;
                    std::cout << "input Tile dimension: ";
                    for (int j{0}; j < 4; j++) {
                        if (inputDims != NULL)
                                std::cout << "[" << j << "]: " << inputDims[j] << "\t";
                    }

                    std::cout << "\noutput tile dimension: ";
                    for (int j{0}; j < 4; j++) {
                        if (outputDims != NULL)
                                std::cout << "[" << j << "]: " << outputDims[j] << "\t";
                    }
                    std::cout <<std::endl;

                    invokeKernel(
                            smv::kPoolingHw,
                            opType == MaxPooling ? smv_maxpooling_nhwc_vec_fxp
                                                 : smv_avgpooling_nhwc_vec_fxp,
                            inputTile->data<float16>(),
                            outputTile->data<float16>(), smv::spad0, smv::spad1,
                            inputDims, outputDims, inputShape.getPadding(3),
                            outputShape.getPadding(3), getPoolingSize().first,
                            getPoolingSize().second, getPoolingStride().first,
                            getPoolingStride().second, ofmapStart, &sampling);

                    ofmapOffset += inputTile->getShape()[3];
                    if (inputChanTiles == outputChanTiles) {
                        iC++;
                        oC++;
                    } else if (outputChanTiles == 1) {
                        iC++;
                    } else {
                        assert(false &&
                               "The inputs/outputs tiles can have different "
                               "number of channels only when the outputs don't "
                               "need channelwise tiling.");
                    }
                }
            }
        }
    }
}

void SmvPoolingOp::tile() {
    // This function will tile (if necessary) the input/output tensors
    // of the pooling operator into smaller tensor tiles so that each tile
    // can fit in the corresponding scratchpad of the accelerator.
    tiledTensors = smaug::smv::pool::TilingOptimizer::doTiling(this);
}

void SmvPoolingOp::run() {
    auto input = getInput(Inputs);
    auto output = getOutput(Outputs);
    const TensorShape& inputShape = input->getShape();
    const TensorShape& outputShape = output->getShape();
    assert(inputShape.getLayout() == DataLayout::NHWC);
    assert(outputShape.getLayout() == DataLayout::NHWC);

    {
        auto stats = gem5::ScopedStats(
                stats::kTensorPrepStart, stats::kTensorPrepEnd);
        tiledTensors[0].copyDataToAllTiles();
    }

    runNHWC(tiledTensors[0], tiledTensors[1]);

    {
        auto stats = gem5::ScopedStats(
                stats::kTensorFinalStart, stats::kTensorFinalEnd);
        tiledTensors[1].untile();
    }
}

void SmvMaxPoolingOp::tile() { SmvPoolingOp::tile(); }

void SmvAvgPoolingOp::tile() { SmvPoolingOp::tile(); }

void SmvMaxPoolingOp::run() { SmvPoolingOp::run(); }

void SmvAvgPoolingOp::run() { SmvPoolingOp::run(); }

}  // namespace smaug

