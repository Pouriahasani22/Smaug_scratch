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

# Utility rule file for triad.

# Include the progress variables for this target.
include example/triad/CMakeFiles/triad.dir/progress.make

example/triad/CMakeFiles/triad: example/triad/triad.llvm


example/triad/triad.llvm: example/triad/triad.unopt.llvm
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/workspace/LLVM-Tracer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating triad.llvm"
	cd /workspace/LLVM-Tracer/build/example/triad && /usr/local/bin/opt -o /workspace/LLVM-Tracer/build/example/triad/triad.llvm /workspace/LLVM-Tracer/build/example/triad/triad.unopt.llvm

example/triad/triad.unopt.llvm: example/triad/triad.obj.llvm
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/workspace/LLVM-Tracer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating triad.unopt.llvm"
	cd /workspace/LLVM-Tracer/build/example/triad && /usr/local/bin/llvm-link /workspace/LLVM-Tracer/build/example/triad/triad.obj.llvm -o /workspace/LLVM-Tracer/build/example/triad/triad.unopt.llvm

example/triad/triad.obj.llvm: ../example/triad/triad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/workspace/LLVM-Tracer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating triad.obj.llvm"
	cd /workspace/LLVM-Tracer/build/example/triad && /usr/local/bin/clang-6.0 "-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS" -fno-inline-functions -fno-use-cxa-atexit -g -O1 -fno-slp-vectorize -fno-vectorize -fno-unroll-loops -fno-inline -fno-builtin -I/usr/include -emit-llvm -c /workspace/LLVM-Tracer/example/triad/triad.c -o /workspace/LLVM-Tracer/build/example/triad/triad.obj.llvm

triad: example/triad/CMakeFiles/triad
triad: example/triad/triad.llvm
triad: example/triad/triad.unopt.llvm
triad: example/triad/triad.obj.llvm
triad: example/triad/CMakeFiles/triad.dir/build.make

.PHONY : triad

# Rule to build all files generated by this target.
example/triad/CMakeFiles/triad.dir/build: triad

.PHONY : example/triad/CMakeFiles/triad.dir/build

example/triad/CMakeFiles/triad.dir/clean:
	cd /workspace/LLVM-Tracer/build/example/triad && $(CMAKE_COMMAND) -P CMakeFiles/triad.dir/cmake_clean.cmake
.PHONY : example/triad/CMakeFiles/triad.dir/clean

example/triad/CMakeFiles/triad.dir/depend:
	cd /workspace/LLVM-Tracer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/LLVM-Tracer /workspace/LLVM-Tracer/example/triad /workspace/LLVM-Tracer/build /workspace/LLVM-Tracer/build/example/triad /workspace/LLVM-Tracer/build/example/triad/CMakeFiles/triad.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/triad/CMakeFiles/triad.dir/depend

