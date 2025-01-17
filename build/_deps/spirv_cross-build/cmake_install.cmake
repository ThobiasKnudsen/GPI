# Install script for directory: /home/tk/dev/GPI/build/_deps/spirv_cross-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/spirv-cross-c.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-core.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/GLSL.std.450.h"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_common.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_containers.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_error_handling.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_parser.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_parsed_ir.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cfg.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_core/cmake/spirv_cross_coreConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_core/cmake/spirv_cross_coreConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/c867e332942f9fbfd00502e244840eeb/spirv_cross_coreConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_core/cmake/spirv_cross_coreConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_core/cmake/spirv_cross_coreConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_core/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/c867e332942f9fbfd00502e244840eeb/spirv_cross_coreConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_core/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/c867e332942f9fbfd00502e244840eeb/spirv_cross_coreConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-glsl.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_glsl.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_glsl/cmake/spirv_cross_glslConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_glsl/cmake/spirv_cross_glslConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/e2b605c21150436e2d28319122566e16/spirv_cross_glslConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_glsl/cmake/spirv_cross_glslConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_glsl/cmake/spirv_cross_glslConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_glsl/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/e2b605c21150436e2d28319122566e16/spirv_cross_glslConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_glsl/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/e2b605c21150436e2d28319122566e16/spirv_cross_glslConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-cpp.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cpp.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_cpp/cmake/spirv_cross_cppConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_cpp/cmake/spirv_cross_cppConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/e4e8b47b5dea7a8da80c394f3d708597/spirv_cross_cppConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_cpp/cmake/spirv_cross_cppConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_cpp/cmake/spirv_cross_cppConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_cpp/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/e4e8b47b5dea7a8da80c394f3d708597/spirv_cross_cppConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_cpp/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/e4e8b47b5dea7a8da80c394f3d708597/spirv_cross_cppConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-reflect.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_reflect.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_reflect/cmake/spirv_cross_reflectConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_reflect/cmake/spirv_cross_reflectConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/53f8cf94f22a1f78c96b8f281c6786ac/spirv_cross_reflectConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_reflect/cmake/spirv_cross_reflectConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_reflect/cmake/spirv_cross_reflectConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_reflect/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/53f8cf94f22a1f78c96b8f281c6786ac/spirv_cross_reflectConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_reflect/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/53f8cf94f22a1f78c96b8f281c6786ac/spirv_cross_reflectConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-msl.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_msl.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_msl/cmake/spirv_cross_mslConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_msl/cmake/spirv_cross_mslConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/ce35db60f39fa04fd857e126f4dc3123/spirv_cross_mslConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_msl/cmake/spirv_cross_mslConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_msl/cmake/spirv_cross_mslConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_msl/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/ce35db60f39fa04fd857e126f4dc3123/spirv_cross_mslConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_msl/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/ce35db60f39fa04fd857e126f4dc3123/spirv_cross_mslConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-hlsl.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_hlsl.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_hlsl/cmake/spirv_cross_hlslConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_hlsl/cmake/spirv_cross_hlslConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/7fc66e572ce2ebd507dfbdc071cfe3b7/spirv_cross_hlslConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_hlsl/cmake/spirv_cross_hlslConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_hlsl/cmake/spirv_cross_hlslConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_hlsl/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/7fc66e572ce2ebd507dfbdc071cfe3b7/spirv_cross_hlslConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_hlsl/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/7fc66e572ce2ebd507dfbdc071cfe3b7/spirv_cross_hlslConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-util.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_util.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_util/cmake/spirv_cross_utilConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_util/cmake/spirv_cross_utilConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/ec42c177c5387f57cff93cface715bc9/spirv_cross_utilConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_util/cmake/spirv_cross_utilConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_util/cmake/spirv_cross_utilConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_util/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/ec42c177c5387f57cff93cface715bc9/spirv_cross_utilConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_util/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/ec42c177c5387f57cff93cface715bc9/spirv_cross_utilConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-c.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv.h"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_c.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c/cmake/spirv_cross_cConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c/cmake/spirv_cross_cConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/5fd2405ca235bfbb625072e4bac10ae3/spirv_cross_cConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c/cmake/spirv_cross_cConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c/cmake/spirv_cross_cConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/5fd2405ca235bfbb625072e4bac10ae3/spirv_cross_cConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/5fd2405ca235bfbb625072e4bac10ae3/spirv_cross_cConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/spirv-cross-c-shared.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libspirv-cross-c-shared.so.0.64.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libspirv-cross-c-shared.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-c-shared.so.0.64.0"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-c-shared.so.0"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libspirv-cross-c-shared.so.0.64.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libspirv-cross-c-shared.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/libspirv-cross-c-shared.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spirv_cross" TYPE FILE FILES
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/GLSL.std.450.h"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_common.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_containers.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_error_handling.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_parser.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_parsed_ir.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cfg.hpp"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv.h"
    "/home/tk/dev/GPI/build/_deps/spirv_cross-src/spirv_cross_c.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c_shared/cmake/spirv_cross_c_sharedConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c_shared/cmake/spirv_cross_c_sharedConfig.cmake"
         "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/07f483a636cc4628666b8368cf944324/spirv_cross_c_sharedConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c_shared/cmake/spirv_cross_c_sharedConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c_shared/cmake/spirv_cross_c_sharedConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c_shared/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/07f483a636cc4628666b8368cf944324/spirv_cross_c_sharedConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spirv_cross_c_shared/cmake" TYPE FILE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/Export/07f483a636cc4628666b8368cf944324/spirv_cross_c_sharedConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spirv-cross" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spirv-cross")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spirv-cross"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/tk/dev/GPI/build/_deps/spirv_cross-build/spirv-cross")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spirv-cross" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spirv-cross")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spirv-cross")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/tk/dev/GPI/build/_deps/spirv_cross-build/CMakeFiles/spirv-cross.dir/install-cxx-module-bmi-noconfig.cmake" OPTIONAL)
endif()
