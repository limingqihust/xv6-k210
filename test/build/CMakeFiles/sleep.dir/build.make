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
CMAKE_SOURCE_DIR = /home/lmq/Desktop/xv6-k210/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lmq/Desktop/xv6-k210/test/build

# Include any dependencies generated for this target.
include CMakeFiles/sleep.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sleep.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sleep.dir/flags.make

CMakeFiles/sleep.dir/src/oscomp/sleep.c.o: CMakeFiles/sleep.dir/flags.make
CMakeFiles/sleep.dir/src/oscomp/sleep.c.o: ../src/oscomp/sleep.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lmq/Desktop/xv6-k210/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sleep.dir/src/oscomp/sleep.c.o"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sleep.dir/src/oscomp/sleep.c.o   -c /home/lmq/Desktop/xv6-k210/test/src/oscomp/sleep.c

CMakeFiles/sleep.dir/src/oscomp/sleep.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sleep.dir/src/oscomp/sleep.c.i"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lmq/Desktop/xv6-k210/test/src/oscomp/sleep.c > CMakeFiles/sleep.dir/src/oscomp/sleep.c.i

CMakeFiles/sleep.dir/src/oscomp/sleep.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sleep.dir/src/oscomp/sleep.c.s"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lmq/Desktop/xv6-k210/test/src/oscomp/sleep.c -o CMakeFiles/sleep.dir/src/oscomp/sleep.c.s

# Object files for target sleep
sleep_OBJECTS = \
"CMakeFiles/sleep.dir/src/oscomp/sleep.c.o"

# External object files for target sleep
sleep_EXTERNAL_OBJECTS =

riscv64/sleep: CMakeFiles/sleep.dir/src/oscomp/sleep.c.o
riscv64/sleep: CMakeFiles/sleep.dir/build.make
riscv64/sleep: libulib.a
riscv64/sleep: CMakeFiles/sleep.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lmq/Desktop/xv6-k210/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable riscv64/sleep"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sleep.dir/link.txt --verbose=$(VERBOSE)
	mkdir -p asm
	riscv64-unknown-elf-objdump -d -S /home/lmq/Desktop/xv6-k210/test/build/riscv64/sleep > asm/sleep.asm
	mkdir -p bin
	riscv64-unknown-elf-objcopy -O binary /home/lmq/Desktop/xv6-k210/test/build/riscv64/sleep bin/sleep.bin --set-section-flags .bss=alloc,load,contents

# Rule to build all files generated by this target.
CMakeFiles/sleep.dir/build: riscv64/sleep

.PHONY : CMakeFiles/sleep.dir/build

CMakeFiles/sleep.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sleep.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sleep.dir/clean

CMakeFiles/sleep.dir/depend:
	cd /home/lmq/Desktop/xv6-k210/test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lmq/Desktop/xv6-k210/test /home/lmq/Desktop/xv6-k210/test /home/lmq/Desktop/xv6-k210/test/build /home/lmq/Desktop/xv6-k210/test/build /home/lmq/Desktop/xv6-k210/test/build/CMakeFiles/sleep.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sleep.dir/depend

