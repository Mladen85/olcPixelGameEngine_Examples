# olcPixelGameEngine Examples

This repository contains a collection of examples and applications demonstrating the use of the [olcPixelGameEngine](https://github.com/OneLoneCoder/olcPixelGameEngine).

The goal of this project is to explore cross-platform development (Windows and Linux) and document the learning process through practical code samples.

See [Git_branching](Git_branching.md) for info how to navigate through projects.

---

## License
This project and all its examples are licensed under the OLC-3 License.

A copy of the license is included in the LICENSE file. Per the license requirements, the original engine author (javidx9) is credited in both the source and binary forms of these applications.

For more information see [`LICENSE`](LICENSE) and [`olcPixelGameEngine/LICENCE.md`](code/ThirdParty/olcPixelGameEngine/LICENCE.md).

---

## Credits

This project is built using the **olcPixelGameEngine**, created by **javidx9** (OneLoneCoder).

- **Engine Author:** [javidx9/OneLoneCoder](https://github.com/OneLoneCoder)
- **YouTube Channel:** [javidx9](https://www.youtube.com/javidx9)

---

## Getting Started

### Cloning the Repository
Since this project uses the olcPixelGameEngine as a Git Submodule, you must clone the repository recursively to include the engine source code:

```bash
git clone --recursive https://github.com/Mladen85/olcPixelGameEngine_Examples.git

# If you have already cloned the repository without submodules, run:
git submodule update --init --recursive
```

### Coding guidelines
Refer to [`docs/03_Process/Coding_Guideline.md`](docs/03_Process/Coding_Guideline.md) for coding guideline stiles for different programming languages.

### Backlog tasks
Refer to [`docs/03_Process/Backlog.md`](docs/03_Process/Backlog.md) for open tasks.

---

## Maintenance
To update the engine submodule to the latest commit from its main branch, run:
```bash
git submodule update --remote --merge
```
<br>

### Hooks
Copy following hooks to to `.git/hooks` directory so git can suggest correct branch name and check commit signature:
- [`pre-push`](pre-push)
- [`post-commit`](post-commit)
<br><br>

### Pull Request guideline
<br>

#### Signed commits
This guide explains how to use an SSH key to sign commits for GitHub.

1. Generate or Identify your SSH Key
If you don't have one, generate it:
```bash
ssh-keygen -t ed25519 -C "<email>"
```
**NOTE**: `<email>` shall match your E-mail set in global git config (```~/.gitconfig```, check if you set your real E-mail or anonymous).

2. Add the Key to GitHub
- Copy your public key: ```cat ~/.ssh/id_ed25519.pub```
- Go to GitHub Settings -> SSH and GPG keys.
- Click **New SSH Key**.
- **CRITICAL:** Change 'Key type' to **Signing Key**.
- Paste your key and save.

3. Configure Local Git
Run these commands to tell Git to use SSH instead of GPG:

```bash
# Change format to SSH
git config --global gpg.format ssh

# Point to your PRIVATE key file
git config --global user.signingkey ~/.ssh/id_ed25519

# Enable signing by default
git config --global commit.gpgsign true
```

4. Local check
```post-commit``` and ```pre-push``` hooks can check if commits are signed and prevent pushing to remote.<br>
To enable correct workflow add additional file that will hold signatures
```bash
# This takes your email and your public key and puts them in a format Git understands
echo "$(git config user.email) $(cat ~/.ssh/id_ed25519.pub)" > ~/.ssh/allowed_signers

# Tell Git where the file is
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers

# Test command in console (prints commit hash %H and if commit is signed correctly or not
#   %G? -> G - commit is verified, B - bad signature, "U" - good signature with unknown validity...)
git log origin/master..HEAD --format="%H %G?"
```

5. Fix Unverified Commits. If you have a commit that is already pushed but unverified, amend it:

```bash
git commit --amend --no-edit
git push origin <branch> --force-with-lease
```

6. Verification
Run ```git log --show-signature``` to verify local signatures. On GitHub, look for the green Verified badge next to the commit.<br>

#### PR Labeling
Use following label system for PR-s:
- Project classification: ```proj:<project_name>``` to classify which project is affected with this PR.
- PR type: ```Documentation```, ```Implementation``` and ```Bug```.

---

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
- [] - a
- [] - b