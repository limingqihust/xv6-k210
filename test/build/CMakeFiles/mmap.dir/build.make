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
CMAKE_SOURCE_DIR = /home/lmq/lmq/cscc/xv6-k210/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lmq/lmq/cscc/xv6-k210/test/build

# Include any dependencies generated for this target.
include CMakeFiles/mmap.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mmap.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mmap.dir/flags.make

CMakeFiles/mmap.dir/src/oscomp/mmap.c.o: CMakeFiles/mmap.dir/flags.make
CMakeFiles/mmap.dir/src/oscomp/mmap.c.o: ../src/oscomp/mmap.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lmq/lmq/cscc/xv6-k210/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/mmap.dir/src/oscomp/mmap.c.o"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mmap.dir/src/oscomp/mmap.c.o   -c /home/lmq/lmq/cscc/xv6-k210/test/src/oscomp/mmap.c

CMakeFiles/mmap.dir/src/oscomp/mmap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mmap.dir/src/oscomp/mmap.c.i"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lmq/lmq/cscc/xv6-k210/test/src/oscomp/mmap.c > CMakeFiles/mmap.dir/src/oscomp/mmap.c.i

CMakeFiles/mmap.dir/src/oscomp/mmap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mmap.dir/src/oscomp/mmap.c.s"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lmq/lmq/cscc/xv6-k210/test/src/oscomp/mmap.c -o CMakeFiles/mmap.dir/src/oscomp/mmap.c.s

# Object files for target mmap
mmap_OBJECTS = \
"CMakeFiles/mmap.dir/src/oscomp/mmap.c.o"

# External object files for target mmap
mmap_EXTERNAL_OBJECTS =

riscv64/mmap: CMakeFiles/mmap.dir/src/oscomp/mmap.c.o
riscv64/mmap: CMakeFiles/mmap.dir/build.make
riscv64/mmap: libulib.a
riscv64/mmap: CMakeFiles/mmap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lmq/lmq/cscc/xv6-k210/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable riscv64/mmap"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mmap.dir/link.txt --verbose=$(VERBOSE)
	mkdir -p asm
	riscv64-unknown-elf-objdump -d -S /home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/mmap > asm/mmap.asm
	mkdir -p bin
	riscv64-unknown-elf-objcopy -O binary /home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/mmap bin/mmap.bin --set-section-flags .bss=alloc,load,contents

# Rule to build all files generated by this target.
CMakeFiles/mmap.dir/build: riscv64/mmap

.PHONY : CMakeFiles/mmap.dir/build

CMakeFiles/mmap.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mmap.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mmap.dir/clean

CMakeFiles/mmap.dir/depend:
	cd /home/lmq/lmq/cscc/xv6-k210/test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lmq/lmq/cscc/xv6-k210/test /home/lmq/lmq/cscc/xv6-k210/test /home/lmq/lmq/cscc/xv6-k210/test/build /home/lmq/lmq/cscc/xv6-k210/test/build /home/lmq/lmq/cscc/xv6-k210/test/build/CMakeFiles/mmap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mmap.dir/depend

