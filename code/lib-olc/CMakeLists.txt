cmake_minimum_required(VERSION 3.14)
project(lib-olc CXX)

# Create the static engine library
add_library(lib-olc
    STATIC
        src/olcPixelGameEngine.cpp
)

# Point to where the actual header file lives in ThirdParty
target_include_directories(lib-olc 
    PUBLIC SYSTEM
        ${CMAKE_CURRENT_SOURCE_DIR}/../ThirdParty/olcPixelGameEngine
)

# TARGET ISOLATION: Disable the breaking errors ONLY for this library target
target_compile_options(lib-olc PRIVATE
    -Wno-error=pedantic
    -Wno-error=sign-compare
    -Wno-error=unused-parameter
    -Wno-error=unknown-pragmas
)

# If you are on Linux, olc requires specific system graphic/threading libraries
if(UNIX AND NOT APPLE)
    target_link_libraries(lib-olc
        PUBLIC
            X11
            GL
            pthread
            png
            backtrace
)
endif()