cmake_minimum_required(VERSION 3.19)
project(O C)

include(FetchContent)

# ---------------------------------------
# 1) Global Settings
# ---------------------------------------
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# ---------------------------------------
# 2) Fetch SDL3 (from source)
# ---------------------------------------
FetchContent_Declare(
    SDL3
    GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
    GIT_TAG        main  # Or a stable release
)
set(SDL_SHARED ON CACHE BOOL "" FORCE)
set(SDL_STATIC OFF CACHE BOOL "" FORCE)
set(SDL_TEST   OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(SDL3)

# ---------------------------------------
# 3) Fetch Freetype (from source)
# ---------------------------------------
FetchContent_Declare(
    freetype
    GIT_REPOSITORY https://github.com/freetype/freetype.git
    GIT_TAG        master  # Freetype uses 'master'
)
set(FT_DISABLE_ZLIB  ON CACHE BOOL "" FORCE)
set(FT_DISABLE_BZIP2 ON CACHE BOOL "" FORCE)
set(FT_DISABLE_PNG   ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(freetype)

# ---------------------------------------
# 4) Fetch SDL3_ttf (from source)
# ---------------------------------------
FetchContent_Declare(
    SDL3_ttf
    GIT_REPOSITORY https://github.com/libsdl-org/SDL_ttf.git
    GIT_TAG        main
)
set(SDLTTF_SAMPLES OFF CACHE BOOL "" FORCE)
set(SDLTTF_TESTS   OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(SDL3_ttf)

# ---------------------------------------
# 4) Fetch SPIRV-Cross (from source)
# ---------------------------------------
FetchContent_Declare(
    spirv_cross
    GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Cross.git
    GIT_TAG        main  # or a known commit that includes the define
)
set(SPIRV_CROSS_SHARED ON CACHE BOOL "" FORCE)
# Possibly set SPIRV_CROSS_ENABLE_C_API=ON, etc.

FetchContent_MakeAvailable(spirv_cross)

# Let SDL3_shadercross find it
list(APPEND CMAKE_PREFIX_PATH "${spirv_cross_BINARY_DIR}")
list(APPEND CMAKE_MODULE_PATH "${spirv_cross_BINARY_DIR}")

# ---------------------------------------
# 5) Configure SDL3_shadercross for System Deps
# ---------------------------------------
set(SDLSHADERCROSS_VENDORED OFF CACHE BOOL "" FORCE)  # rely on system libraries
set(SDLSHADERCROSS_DXC OFF CACHE BOOL "" FORCE)       # disable DirectXShaderCompiler on Linux

FetchContent_Declare(
    SDL3_shadercross
    GIT_REPOSITORY https://github.com/libsdl-org/SDL_shadercross.git
    GIT_TAG        main
    # Exclude DirectXShaderCompiler submodule
    GIT_SUBMODULES "external/SPIRV-Cross;external/SPIRV-Headers;external/SPIRV-Tools"
)
FetchContent_MakeAvailable(SDL3_shadercross)

# ---------------------------------------
# 6) Use System-Installed glslang, SPIRV-Tools, spirv-cross, shaderc
# ---------------------------------------
# (No fetch content. Let find_package calls succeed if you installed these dev packages.)

# ---------------------------------------
# 7) SPIRV-Reflect (optional, if you want from source or system)
# ---------------------------------------
# If you also installed via apt, you can skip or remove these lines.
# If you want to fetch from source, uncomment:

FetchContent_Declare(
    spirv-reflect
    GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Reflect.git
    GIT_TAG        main
)
FetchContent_MakeAvailable(spirv-reflect)
# file(GLOB SPIRV_REFLECT_SOURCES "${spirv-reflect_SOURCE_DIR}/spirv_reflect.c")

# ---------------------------------------
# 8) main executable
# ---------------------------------------
add_executable(main
    src/main.c
    src/gpi_debug.c
    src/gpi.c
    ${spirv-reflect_SOURCE_DIR}/spirv_reflect.c
)
target_include_directories(main PRIVATE "${CMAKE_SOURCE_DIR}/include")
target_include_directories(main PRIVATE "${spirv-reflect_SOURCE_DIR}")

target_link_libraries(main
    PRIVATE
        SDL3::SDL3
        SDL3_ttf::SDL3_ttf
        freetype
        SDL3_shadercross::SDL3_shadercross
        # No explicit references to glslang, SPIRV-Tools, spirv-cross, or shaderc
        # because they are found via system packages.
)

message(STATUS "Configuration complete (using system libraries for glslang, etc.).")
