cmake_minimum_required(VERSION 3.14)
project(google_test)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_VERBOSE_MAKEFILE on)

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.12.1
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

set(TEST_TARGET hello_test)

add_executable(${TEST_TARGET}
  src/hello_test.cc
)
target_link_libraries(${TEST_TARGET}
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(${TEST_TARGET})
