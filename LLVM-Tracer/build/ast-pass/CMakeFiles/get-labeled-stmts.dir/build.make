# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/LLVM-Tracer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/LLVM-Tracer/build

# Include any dependencies generated for this target.
include ast-pass/CMakeFiles/get-labeled-stmts.dir/depend.make

# Include the progress variables for this target.
include ast-pass/CMakeFiles/get-labeled-stmts.dir/progress.make

# Include the compile flags for this target's objects.
include ast-pass/CMakeFiles/get-labeled-stmts.dir/flags.make

ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o: ast-pass/CMakeFiles/get-labeled-stmts.dir/flags.make
ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o: ../ast-pass/GetLabeledStmts.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/LLVM-Tracer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o"
	cd /workspace/LLVM-Tracer/build/ast-pass && g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o -c /workspace/LLVM-Tracer/ast-pass/GetLabeledStmts.cpp

ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.i"
	cd /workspace/LLVM-Tracer/build/ast-pass && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/LLVM-Tracer/ast-pass/GetLabeledStmts.cpp > CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.i

ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.s"
	cd /workspace/LLVM-Tracer/build/ast-pass && g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/LLVM-Tracer/ast-pass/GetLabeledStmts.cpp -o CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.s

ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.requires:

.PHONY : ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.requires

ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.provides: ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.requires
	$(MAKE) -f ast-pass/CMakeFiles/get-labeled-stmts.dir/build.make ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.provides.build
.PHONY : ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.provides

ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.provides.build: ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o


# Object files for target get-labeled-stmts
get__labeled__stmts_OBJECTS = \
"CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o"

# External object files for target get-labeled-stmts
get__labeled__stmts_EXTERNAL_OBJECTS =

ast-pass/get-labeled-stmts: ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o
ast-pass/get-labeled-stmts: ast-pass/CMakeFiles/get-labeled-stmts.dir/build.make
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMX86AsmParser.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMX86Desc.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMX86AsmPrinter.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMX86Info.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMX86Utils.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMipo.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMScalarOpts.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMInstCombine.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMTransformUtils.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMAnalysis.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMTarget.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMOption.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMMCParser.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMMC.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMObject.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMBitReader.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMCore.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMSupport.a
ast-pass/get-labeled-stmts: /usr/lib/x86_64-linux-gnu/libcurses.so
ast-pass/get-labeled-stmts: /usr/lib/x86_64-linux-gnu/libform.so
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMMCDisassembler.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMBitWriter.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMIRReader.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMAsmParser.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMInstrumentation.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMLinker.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMVectorize.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMTransformUtils.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMAnalysis.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMObject.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMMCParser.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMBitReader.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMProfileData.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMMC.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMCore.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMBinaryFormat.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMSupport.a
ast-pass/get-labeled-stmts: /usr/local/lib/libLLVMDemangle.a
ast-pass/get-labeled-stmts: ast-pass/CMakeFiles/get-labeled-stmts.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/LLVM-Tracer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable get-labeled-stmts"
	cd /workspace/LLVM-Tracer/build/ast-pass && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/get-labeled-stmts.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ast-pass/CMakeFiles/get-labeled-stmts.dir/build: ast-pass/get-labeled-stmts

.PHONY : ast-pass/CMakeFiles/get-labeled-stmts.dir/build

ast-pass/CMakeFiles/get-labeled-stmts.dir/requires: ast-pass/CMakeFiles/get-labeled-stmts.dir/GetLabeledStmts.cpp.o.requires

.PHONY : ast-pass/CMakeFiles/get-labeled-stmts.dir/requires

ast-pass/CMakeFiles/get-labeled-stmts.dir/clean:
	cd /workspace/LLVM-Tracer/build/ast-pass && $(CMAKE_COMMAND) -P CMakeFiles/get-labeled-stmts.dir/cmake_clean.cmake
.PHONY : ast-pass/CMakeFiles/get-labeled-stmts.dir/clean

ast-pass/CMakeFiles/get-labeled-stmts.dir/depend:
	cd /workspace/LLVM-Tracer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/LLVM-Tracer /workspace/LLVM-Tracer/ast-pass /workspace/LLVM-Tracer/build /workspace/LLVM-Tracer/build/ast-pass /workspace/LLVM-Tracer/build/ast-pass/CMakeFiles/get-labeled-stmts.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ast-pass/CMakeFiles/get-labeled-stmts.dir/depend
