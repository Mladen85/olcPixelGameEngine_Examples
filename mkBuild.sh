#!/bin/bash

# For debugging
#PS4=$'\e[31m+ [${BASH_SOURCE##*/}]:${LINENO}>> \e[0m '
#set -x

# Exit immediately if a command exits with a non-zero status
set -e


# Define directory names
BUILD_DIR="build"
TOOLCHAIN_FILE="code/gcc_x64_toolchain.cmake"

CLEAN_BUILD=false
RUN_TESTS=false


# Debug tool to print call stack with line numbers and function names in bash
print_stack() {
    echo '--- CALL STACK ---'
    local i
    for i in "${!FUNCNAME[@]}"; do
        if [ "$i" -gt 0 ]; then
            echo "  Called by: ${FUNCNAME[$i]} (at line ${BASH_LINENO[$i-1]})"
        fi
    done
    echo '--- CALL STACK END ---'
}

# Function to display usage instructions
usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -c, --clean    Remove the existing build directory before compiling"
    echo "  -t, --test     Run the test suite immediately after a successful build"
    echo "  -h, --help     Display this help message"
    # exit 0
}

# Parse command-line flags

# while [[ "$#" -gt 0 ]]; do
#     case $1 in
#         -c|--clean) CLEAN_BUILD=true ;;
#         -t|--test) RUN_TESTS=true ;;
#         -h|--help) usage ;;
#         *) echo "Unknown parameter passed: $1"; usage; exit 1 ;;
#     case
#     shift
# done

while getopts ":cto:h" opt; do
    case ${opt} in
        c )
            CLEAN_BUILD=true
            ;;
        
        t )
            RUN_TESTS=true
            ;;
        
        o )
            echo "User credentials provided: $OPTARG"
            USERNAME=$(echo "$OPTARG" | cut -d: -f1)
            PASSWORD=$(echo "$OPTARG" | cut -d: -f2-) # add -f2- to support passwords with colons
            # (for example "user:pass:with:colons" -> USERNAME="user", PASSWORD="pass:with:colons")
            ;;
        
        h )
            usage
            exit 0
            ;;
        
        : )
            echo "Option -$OPTARG requires an argument."
            usage
            exit 1
            ;;
        
        \? )
            echo "Invalid option: -$OPTARG"
            usage
            exit 1
            ;;
    esac
done
        

# 1. Handle Optional Clean Phase
if [ "$CLEAN_BUILD" = true ] && [ -d "$BUILD_DIR" ]; then
    echo "=== Cleaning previous build workspace... ==="
    rm -rf "$BUILD_DIR"
fi

# 2. Build Generation Phase (Injecting your toolchain configuration)
if [ ! -d "$BUILD_DIR" ]; then
    echo "=== Configuring CMake with toolchain: $TOOLCHAIN_FILE ==="
    cmake -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" -B "$BUILD_DIR" -S .
else
    echo "=== Build workspace already configured. Skipping generation step. ==="
fi

# 3. Compilation Phase
echo "=== Compiling all project binaries and testing targets... ==="
cmake --build "$BUILD_DIR"

echo "=== Build Completed Successfully! ==="

# 4. Optional Testing Phase (Using CTest)
if [ "$RUN_TESTS" = true ]; then
    echo "=== Executing Automated Test Runner Suite... ==="
    cd "$BUILD_DIR"
    ctest --output-on-failure
fi