# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/lzq/Desktop/oscomp/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lzq/Desktop/oscomp/test/build

# Include any dependencies generated for this target.
include CMakeFiles/getdents.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/getdents.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/getdents.dir/flags.make

CMakeFiles/getdents.dir/src/oscomp/getdents.c.o: CMakeFiles/getdents.dir/flags.make
CMakeFiles/getdents.dir/src/oscomp/getdents.c.o: ../src/oscomp/getdents.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lzq/Desktop/oscomp/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/getdents.dir/src/oscomp/getdents.c.o"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/getdents.dir/src/oscomp/getdents.c.o   -c /home/lzq/Desktop/oscomp/test/src/oscomp/getdents.c

CMakeFiles/getdents.dir/src/oscomp/getdents.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/getdents.dir/src/oscomp/getdents.c.i"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lzq/Desktop/oscomp/test/src/oscomp/getdents.c > CMakeFiles/getdents.dir/src/oscomp/getdents.c.i

CMakeFiles/getdents.dir/src/oscomp/getdents.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/getdents.dir/src/oscomp/getdents.c.s"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lzq/Desktop/oscomp/test/src/oscomp/getdents.c -o CMakeFiles/getdents.dir/src/oscomp/getdents.c.s

# Object files for target getdents
getdents_OBJECTS = \
"CMakeFiles/getdents.dir/src/oscomp/getdents.c.o"

# External object files for target getdents
getdents_EXTERNAL_OBJECTS =

riscv64/getdents: CMakeFiles/getdents.dir/src/oscomp/getdents.c.o
riscv64/getdents: CMakeFiles/getdents.dir/build.make
riscv64/getdents: libulib.a
riscv64/getdents: CMakeFiles/getdents.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lzq/Desktop/oscomp/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable riscv64/getdents"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/getdents.dir/link.txt --verbose=$(VERBOSE)
	mkdir -p asm
	riscv64-unknown-elf-objdump -d -S /home/lzq/Desktop/oscomp/test/build/riscv64/getdents > asm/getdents.asm
	mkdir -p bin
	riscv64-unknown-elf-objcopy -O binary /home/lzq/Desktop/oscomp/test/build/riscv64/getdents bin/getdents.bin --set-section-flags .bss=alloc,load,contents

# Rule to build all files generated by this target.
CMakeFiles/getdents.dir/build: riscv64/getdents

.PHONY : CMakeFiles/getdents.dir/build

CMakeFiles/getdents.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/getdents.dir/cmake_clean.cmake
.PHONY : CMakeFiles/getdents.dir/clean

CMakeFiles/getdents.dir/depend:
	cd /home/lzq/Desktop/oscomp/test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lzq/Desktop/oscomp/test /home/lzq/Desktop/oscomp/test /home/lzq/Desktop/oscomp/test/build /home/lzq/Desktop/oscomp/test/build /home/lzq/Desktop/oscomp/test/build/CMakeFiles/getdents.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/getdents.dir/depend

