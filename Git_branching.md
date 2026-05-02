# Branching Strategy

This document outlines the branching strategy for the project.

## Master branch
The `master` branch shall be used for general files only (README.md, LICENSE, etc.).
For updating master branch use `feature/master_XYZ` branch for merging changes.

## Project branch
A dedicated `<project>` branch will be used for the development of each project.<br>
The release version for each project shall be labeled with tag `<project>_XXX`.

## Feature branch
Feature branches will be used for adding features and shall be named `<project>_f/XXX_Description`.<br>
Branch ID `XXX`: if there is an issue created in GitHub, the issue ID shall be used. If an issue is not created, the ID can be skipped `<project>_f/Description`.<br>
Commit messages shall start with `<project>_f/XXX: <Description>`.<br>
Feature branches will be merged into the corresponding `<project>` branch.<br>
Feature branches will be deleted after the merge.

## Bugfix branch
Bugfix branches will be used for fixing bugs and shall be named `<project>_bug/XXX_Description`.<br>
Branch ID `XXX` shall be the Issue ID from GitHub.<br>
Commit messages shall start with `<project>_bug/XXX: <Description>`.<br>
Bugfix branches will be merged into the corresponding `<project>` branch.<br>
Bugfix branches will be deleted after the merge.

## Other branch
If there is a need for other branches, they shall be explained here.

**Note:** This project doesn't use a development branch. Instead, project branches will be used for each project.
```
## `development` branch
Will be used during development.<br>
Release versions will be tagged on each `<project>` branch.
```

# TODO list
- [ ] Create an issue on GitHub (mandatory for bugfix, optional for feature)
- [ ] Clone/Update the project, create the corresponding branch (feature or bugfix)
- [ ] To merge implementation, create a Pull Request