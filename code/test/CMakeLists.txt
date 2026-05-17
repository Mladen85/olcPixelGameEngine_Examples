cmake_minimum_required(VERSION 3.14)
project(BallTestSuite CXX)

# 1. Enable CMake's internal CTest test runner engine
enable_testing()

# 2. Locate and configure GoogleTest (assuming it's sub-directed in ThirdParty)
# If you haven't added it yet, ensure your root or ThirdParty CMake handles add_subdirectory
# For this script, we assume the targets 'gtest' and 'gtest_main' are available.

# 3. Define the test executable runner target
add_executable(BallTests
    src/BallTest.cpp
)

# 4. Link dependencies: GoogleTest, your physics code, and the olc vectors
# Note: linking gtest_main provides a standard main() loop so you don't have to write one!
target_link_libraries(BallTests 
    PRIVATE 
        gtest 
        gtest_main 
        lib-physics # Links your Ball engine logic
        lib-olc      # Links the vector structures (olc::vf2d)
)

# TARGET ISOLATION: Disable the breaking errors ONLY for this library target
target_compile_options(BallTests PRIVATE
    -Wno-error=pedantic
    -Wno-error=sign-compare
    -Wno-error=unused-parameter
    -Wno-error=unknown-pragmas
)

# 5. Tell CMake/CTest that this executable contains discoverable tests
include(GoogleTest)
gtest_discover_tests(BallTests)