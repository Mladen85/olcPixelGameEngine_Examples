# olcPixelGameEngine Examples

This repository contains a collection of examples and applications demonstrating the use of the [olcPixelGameEngine](https://github.com/OneLoneCoder/olcPixelGameEngine).

The goal of this project is to explore cross-platform development (Windows and Linux) and document the learning process through practical code samples.

## Credits

This project is built using the **olcPixelGameEngine**, created by **javidx9** (OneLoneCoder).

- **Engine Author:** [javidx9/OneLoneCoder](https://github.com/OneLoneCoder)
- **YouTube Channel:** [javidx9](https://www.youtube.com/javidx9)

## Getting Started

### Cloning the Repository
Since this project uses the olcPixelGameEngine as a Git Submodule, you must clone the repository recursively to include the engine source code:

```bash
git clone --recursive https://github.com/Mladen85/olcPixelGameEngine_Examples.git

# If you have already cloned the repository without submodules, run:
git submodule update --init --recursive
```

### Maintenance
To update the engine submodule to the latest commit from its main branch, run:
```bash
git submodule update --remote --merge
```

## License
This project and all its examples are licensed under the OLC-3 License.

A copy of the license is included in the LICENSE file. Per the license requirements, the original engine author (javidx9) is credited in both the source and binary forms of these applications.

## ThirdParty modules

### olcPixelGameEngine
```bash
git submodule add https://github.com/OneLoneCoder/olcPixelGameEngine.git code/ThirdParty/olcPixelGameEngine
```

### GTest
```bash
git submodule add https://github.com/google/googletest.git code/ThirdParty/googletest
```

### Doxygen
1. Instalation
```bash
sudo apt install doxygen graphviz
```
2. Create the configuration file (Doxyfile)
```bash
doxygen -g
```
3. Basic configuration
   Open the Doxyfile in a text editor and adjust these key settings to match project structure:
```plaintext
PROJECT_NAME: "Project Name"
INPUT: Path to source code (e.g., ./code)
OUTPUT_DIRECTORY: Path for the docs (e.g., ./docs/doxygen)
RECURSIVE: Set to YES to scan subdirectories.
EXTRACT_ALL: Set to YES to document even undocumented members.
HAVE_DOT: Set to YES if you installed Graphviz to get diagrams.
```
4. Integrating with CMake
```cmake
find_package(Doxygen)
if (DOXYGEN_FOUND)
    # Configure Doxygen tags directly in CMake
    set(DOXYGEN_PROJECT_NAME "My PGE Project")
    set(DOXYGEN_INPUT ${PROJECT_SOURCE_DIR}/code)
    
    # Add a custom target to generate documentation
    doxygen_add_docs(doxygen-docs ${PROJECT_SOURCE_DIR})
endif()
```