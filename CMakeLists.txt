cmake_minimum_required(VERSION 3.27)

project(hypatia)

# remove "lib" prefix on unix systems
set(CMAKE_STATIC_LIBRARY_PREFIX "")

if (WIN32)
    set(OUTPUT_DIR "windows" CACHE STRING "")
elseif(APPLE)
    set(OUTPUT_DIR "macos" CACHE STRING "")
elseif(UNIX)
    set(OUTPUT_DIR "linux" CACHE STRING "")
endif ()


# header only library, copy to .c file
configure_file(hypatia/hypatia.h ../hypatia.c COPYONLY)

# header only library, add implementation define
add_compile_definitions(HYPATIA_IMPLEMENTATION)

add_library(hypatia STATIC hypatia/hypatia.c)

set_target_properties(hypatia PROPERTIES OUTPUT_NAME_DEBUG "hypatiad")
set_target_properties(hypatia PROPERTIES OUTPUT_NAME_RELEASE "hypatia")
set_target_properties(hypatia PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../libs/${OUTPUT_DIR}>) 