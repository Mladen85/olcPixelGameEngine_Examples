# This script generates the LICENSE and README.md files.

license_content = """Copyright 2026 Mladen

License (OLC-3)
-------------------------------------------------------------------------------
1. All software and direct derivatives must be redistributed in source form.

2. All software and direct derivatives must be redistributed free of charge.

3. All software and direct derivatives must retain this copyright notice, and
   a visible acknowledgement of the author must be provided in the binary form
   and source form of the software.
-------------------------------------------------------------------------------

Note: This project uses the olcPixelGameEngine, which is also licensed under OLC-3
by its original author, javidx9 (OneLoneCoder).
"""

readme_content = """# olcPixelGameEngine Examples

This repository contains a collection of examples and applications demonstrating the use of the [olcPixelGameEngine](https://github.com/OneLoneCoder/olcPixelGameEngine).

The goal of this project is to explore cross-platform development (Windows and Linux) and document the learning process through practical code samples.

## Credits

This project is built using the **olcPixelGameEngine**, created by **javidx9** (OneLoneCoder).

- **Engine Author:** [javidx9 / OneLoneCoder](https://github.com/OneLoneCoder)
- **YouTube Channel:** [javidx9](https://www.youtube.com/javidx9)

## Getting Started

### Cloning the Repository
Since this project uses the olcPixelGameEngine as a Git Submodule, you must clone the repository recursively to include the engine source code:

```bash
git clone --recursive https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

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
"""

def generate_files():
    try:
        with open("LICENSE", "w", encoding="utf-8") as f:
            f.write(license_content)
        print("Successfully generated LICENSE")

        with open("README.md", "w", encoding="utf-8") as f:
            f.write(readme_content)
        print("Successfully generated README.md")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    generate_files()