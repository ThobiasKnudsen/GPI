#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "spirv-cross-reflect" for configuration ""
set_property(TARGET spirv-cross-reflect APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(spirv-cross-reflect PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libspirv-cross-reflect.a"
  )

list(APPEND _cmake_import_check_targets spirv-cross-reflect )
list(APPEND _cmake_import_check_files_for_spirv-cross-reflect "${_IMPORT_PREFIX}/lib/libspirv-cross-reflect.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
