cmake_minimum_required(VERSION 3.14)
project(lib-physics CXX)

# Gather all implementation source files safely
add_library(lib-physics STATIC
    src/Ball.cpp
)

# Expose the public headers folder to any target linking against this library
target_include_directories(lib-physics
    PUBLIC 
        ${CMAKE_CURRENT_SOURCE_DIR}/api
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/inc
)

# Link against lib-olc so Ball.hpp can use the olc::vf2d data structures
target_link_libraries(lib-physics
    PUBLIC
        lib-olc
)