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
include CMakeFiles/waitpid.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/waitpid.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/waitpid.dir/flags.make

CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.o: CMakeFiles/waitpid.dir/flags.make
CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.o: ../src/oscomp/waitpid.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lzq/Desktop/oscomp/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.o"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.o   -c /home/lzq/Desktop/oscomp/test/src/oscomp/waitpid.c

CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.i"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lzq/Desktop/oscomp/test/src/oscomp/waitpid.c > CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.i

CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.s"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lzq/Desktop/oscomp/test/src/oscomp/waitpid.c -o CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.s

# Object files for target waitpid
waitpid_OBJECTS = \
"CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.o"

# External object files for target waitpid
waitpid_EXTERNAL_OBJECTS =

riscv64/waitpid: CMakeFiles/waitpid.dir/src/oscomp/waitpid.c.o
riscv64/waitpid: CMakeFiles/waitpid.dir/build.make
riscv64/waitpid: libulib.a
riscv64/waitpid: CMakeFiles/waitpid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lzq/Desktop/oscomp/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable riscv64/waitpid"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/waitpid.dir/link.txt --verbose=$(VERBOSE)
	mkdir -p asm
	riscv64-unknown-elf-objdump -d -S /home/lzq/Desktop/oscomp/test/build/riscv64/waitpid > asm/waitpid.asm
	mkdir -p bin
	riscv64-unknown-elf-objcopy -O binary /home/lzq/Desktop/oscomp/test/build/riscv64/waitpid bin/waitpid.bin --set-section-flags .bss=alloc,load,contents

# Rule to build all files generated by this target.
CMakeFiles/waitpid.dir/build: riscv64/waitpid

.PHONY : CMakeFiles/waitpid.dir/build

CMakeFiles/waitpid.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/waitpid.dir/cmake_clean.cmake
.PHONY : CMakeFiles/waitpid.dir/clean

CMakeFiles/waitpid.dir/depend:
	cd /home/lzq/Desktop/oscomp/test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lzq/Desktop/oscomp/test /home/lzq/Desktop/oscomp/test /home/lzq/Desktop/oscomp/test/build /home/lzq/Desktop/oscomp/test/build /home/lzq/Desktop/oscomp/test/build/CMakeFiles/waitpid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/waitpid.dir/depend

