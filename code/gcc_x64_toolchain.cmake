# --- CMake Toolchain File for GCC x64 ---

# 1. Target System Configuration
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# 2. Specify the Compilers
set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

# 3. Language Standards
# Added C++17 requirement for olcPixelGameEngine
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 4. Standard C/C++ Flags
# -Werror: Makes all warnings into errors (Professional/Automotive standard)
set(COMMON_FLAGS "-Wall -Wextra -Wpedantic -Werror -m64")

set(CMAKE_C_FLAGS "${COMMON_FLAGS}" CACHE STRING "C flags")
set(CMAKE_CXX_FLAGS "${COMMON_FLAGS}" CACHE STRING "C++ flags")

# 5. Search Path Configuration
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)