# Documentation

## Documentation hierarchy

docs/
├── 01_Requirements/
│   ├── System_Requirements.md   # High-level goals (e.g., "Must run on Linux/Win")
│   └── Functional_Reqs.md      # Game logic goals (e.g., "Physics shall handle gravity")
├── 02_Architecture/
│   ├── System_Architecture.md   # Layered diagram (App -> Logic -> Engine)
│   └── Interface_Definitions.md # Detailed look at IDisplay, etc.
└── 03_Process/
    └── TDD_Guide.md            # Your personal notes on the workflow


## Setting CODEOWNERS

If `Settings->Rules->Rulesets->Require a pull request before merging->Require review from Code Owners` is selected, create `.github/CODEOWNERS` file with list of code owners. 