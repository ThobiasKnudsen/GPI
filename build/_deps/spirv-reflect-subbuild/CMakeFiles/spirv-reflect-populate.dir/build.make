# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild

# Utility rule file for spirv-reflect-populate.

# Include any custom commands dependencies for this target.
include CMakeFiles/spirv-reflect-populate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/spirv-reflect-populate.dir/progress.make

CMakeFiles/spirv-reflect-populate: CMakeFiles/spirv-reflect-populate-complete

CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-install
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-mkdir
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-download
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-configure
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-build
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-install
CMakeFiles/spirv-reflect-populate-complete: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'spirv-reflect-populate'"
	/usr/bin/cmake -E make_directory /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles
	/usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles/spirv-reflect-populate-complete
	/usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-done

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update:
.PHONY : spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-build: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'spirv-reflect-populate'"
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E echo_append
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-build

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-configure: spirv-reflect-populate-prefix/tmp/spirv-reflect-populate-cfgcmd.txt
spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-configure: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'spirv-reflect-populate'"
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E echo_append
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-configure

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-download: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-gitinfo.txt
spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-download: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'spirv-reflect-populate'"
	cd /home/tk/dev/GPI/build/_deps && /usr/bin/cmake -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/tmp/spirv-reflect-populate-gitclone.cmake
	cd /home/tk/dev/GPI/build/_deps && /usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-download

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-install: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'spirv-reflect-populate'"
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E echo_append
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-install

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'spirv-reflect-populate'"
	/usr/bin/cmake -Dcfgdir= -P /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/tmp/spirv-reflect-populate-mkdirs.cmake
	/usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-mkdir

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch-info.txt
spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'spirv-reflect-populate'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update:
.PHONY : spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-test: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'spirv-reflect-populate'"
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E echo_append
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-build && /usr/bin/cmake -E touch /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-test

spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update: spirv-reflect-populate-prefix/tmp/spirv-reflect-populate-gitupdate.cmake
spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update-info.txt
spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'spirv-reflect-populate'"
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-src && /usr/bin/cmake -Dcan_fetch=YES -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/spirv-reflect-populate-prefix/tmp/spirv-reflect-populate-gitupdate.cmake

spirv-reflect-populate: CMakeFiles/spirv-reflect-populate
spirv-reflect-populate: CMakeFiles/spirv-reflect-populate-complete
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-build
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-configure
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-download
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-install
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-mkdir
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-patch
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-test
spirv-reflect-populate: spirv-reflect-populate-prefix/src/spirv-reflect-populate-stamp/spirv-reflect-populate-update
spirv-reflect-populate: CMakeFiles/spirv-reflect-populate.dir/build.make
.PHONY : spirv-reflect-populate

# Rule to build all files generated by this target.
CMakeFiles/spirv-reflect-populate.dir/build: spirv-reflect-populate
.PHONY : CMakeFiles/spirv-reflect-populate.dir/build

CMakeFiles/spirv-reflect-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/spirv-reflect-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/spirv-reflect-populate.dir/clean

CMakeFiles/spirv-reflect-populate.dir/depend:
	cd /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild /home/tk/dev/GPI/build/_deps/spirv-reflect-subbuild/CMakeFiles/spirv-reflect-populate.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/spirv-reflect-populate.dir/depend

