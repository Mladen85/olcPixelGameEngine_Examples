# TDD Guide

## GitHub Rulesets

In repository, go to `Settings->Rules->Rulesets`. Select `Git_branching_project` and check `Require status checks to pass` rule, so that every PR is checked remotely by GitHub.

Create YML file `.github/workflows/cpp-tests.yml`. When option `Require status checks to pass` is selected, his yml file runs gtest on remote GitHub server with Ubuntu. If test fails it will put red 'X' next to commit, and will deny PR merging.

