# CMake file for 'my_program'

# --- Init --------------------------------------------------------------------
cmake_minimum_required(VERSION 3.14)

# Module that enables checking if a symbol is available after including given header file
include(CheckSymbolExists)

# Set the project name and language (ex. CXX, C, etc)
project(<project_name> LANGUAGES <languages>)

# Module that enables populating content at configure time
include(FetchContent)

# Add cmake directory to the Cmake modules path
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Sanitizers
set(SANTIIZER_OPTIONS address memory undefined "")
set(SANITIZER "" CACHE STRING "Select sanitizer")
set_property(CACHE SANITIZER PROPERTY STRINGS ${SANTIIZER_OPTIONS})

# Allow options to conditionally configure this build
option(WITH_OPTION1 "Configure with OPTION" OFF)
option(WITH_OPTION2 "Configure with OPTION" OFF)

# Export compiler symbols so that backtraces are useful
set(CMAKE_ENABLE_EXPORTS ON)

# Generate compile_commands.json for IDE/vim tools
add_definitions(-DCMAKE_EXPORT_COMPILE_COMMANDS=ON)

# Set makefile to print verbose outputs and language standard
set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Debug information for C++ standard libraries.
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_GLIBCXX_DEBUG")

# Turn on CUSTOM_DEBUG compiler switch for Debug builds
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DCUSTOM_DEBUG")

# Check for symbols that might not be present on all platforms
check_symbol_exists(<symbol> <header_file> HAVE_<SYMBOL>)

# Add subdirectories
add_subdirectory(libs/<subdirectory1>)
add_subdirectory(libs/<subdirectory2>)

if(WITH_OPTION1)
    message(STATUS "WITH_OPTION1")
    add_subdirectory(libs/<subdirectory3>)
endif()

if(WITH_OPTION2)
    message(STATUS "WITH_OPTION2")

    # Load dependency content
    FetchContent_Declare(
        <Name>
        GIT_REPOSITORY https://github.com/<repository_name>.git
        GIT_TAG <tag>
        UPDATE_DISCONNECTED ON
    )
    FetchContent_MakeAvailable(Name)
endif()
