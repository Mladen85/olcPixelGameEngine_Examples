cmake_minimum_required(VERSION 3.14)

# 1. Compile the external engine wrapper library first
add_subdirectory(lib-olc)

# 2. Compile your core isolated physics engine component next
add_subdirectory(lib-physics)

# 3. Compile and execute the test runner target last
add_subdirectory(test)