# Branching Strategy

This document outlines the branching strategy for the project.

## Master branch
The `master` branch shall be used for general files only (README.md, LICENSE, etc.).
For updating master branch use `feature/master_Description` branch for merging changes.

---

## Project branch
A dedicated `project-<proj_id>` branch will be used for the development of each project.<br>
The release version for each project shall be labeled with tag `project_XXX`.<br>
`project_XXX` branch can only be created by repo owner directly in GitHub repo.

---

## Implementation branch

Implementation branches will be used for adding features and shall be named **`project-XXX/feature-XX/story-XX_Description`**.<br>
For each **feature** issue can be opened in **GitHub**. Issue shall be named **`project-XXX/feature-XX: <feature_name>`**.<br>
For each feature issue sub-issue shall be created for **story** implementation.<br>
If issue/sub-issue is opened, branch shall be created from issue page (`Create a branch  for this issue or link a pull request.`)<br>
If issue is opened after creating branch, link corresponding branch to that issue, or in the description of the PR, use a special linking keyword followed by the issue number. For example: `Closes #42` or `Fixes #42`.<br> 
Commit messages shall start with **`project-XXX/feature-XX/story-xx: commit_description`**.<br>
if there is an issue created in GitHub, commit message shall end with issue ID. Example commit message: **`project-XXX/feature-XX/story-xx: commit_description (#<issue_number>`**. If an issue is not created, the ID can be skipped.<br>
Implementation branches will be merged into the corresponding `<project>` branch.<br>
Implementation branches will be deleted after the merge.

---

## Bugfix branch
Bugfix branches will be used for fixing bugs and shall be named **`project-XXX/bugfix-XX_Description`**.<br>
For each **bugfix** issue is created in **GitHub**. Issue shall be named **`project-XXX/bugfix-XX: <Bugfix_description>`**.<br>
If branch can be created from issue page (`Create a branch  for this issue or link a pull request.`), or<br>
If issue is opened after creating branch, link corresponding branch to that issue, or in the description of the PR, use a special linking keyword followed by the issue number. For example: `Closes #42` or `Fixes #42`.<br>
Commit messages shall start with **`project-XXX/bugfix-XX/story-xx: commit_description (#<issue_number>`**.<br>
Bugfix branches will be merged into the corresponding `<project>` branch.<br>
Bugfix branches will be deleted after the merge.

---

## Other branch
If there is a need for other branches, they shall be explained here.

**Note:**
- This project doesn't use a development branch. Instead, project branches will be used for each project.
```
## `development` branch
Will be used during development.<br>
Release versions will be tagged on each `<project>` branch.
```
- Rulesets are added. If there are problems with pushing to GitHub or working online, please contact repo admin.

---

## Pull Request template
Pull request template file added to [pull_request_template.md](.github/pull_request_template.md).<br>
When creating PR this template will be automatically loaded in GitHub.

---

# TODO list
- [ ] Create an issue on GitHub (mandatory for bugfix, optional for feature)
- [ ] Clone/Update the project, create the corresponding branch (feature or bugfix)
- [ ] To merge implementation, create a Pull Request