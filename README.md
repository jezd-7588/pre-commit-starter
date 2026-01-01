# Pre-commit Starter

![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)
![GitHub last commit](https://img.shields.io/github/last-commit/jezd-7588/pre-commit-starter)
![GitHub Tag](https://img.shields.io/github/v/tag/jezd-7588/pre-commit-starter)
![made-with-bash](https://img.shields.io/badge/made_with-bash-blue)
![GitHub branch check runs](https://img.shields.io/github/check-runs/jezd-7588/pre-commit-starter/main)


The code in this repo was created to make it easier for developers to get started with DevSecOps and shift left on security — as far left as you can get.

## What is Pre-commit?

Pre-commit is a framework that manages Git hooks to run automated checks before code is committed. This catches security and code quality issues early in development.

## Why Use Pre-commit Hooks?

- **Shift Left**: Catch security and code quality issues before they reach production
- **Automation**: Enforce consistent code standards across your team
- **Fast Feedback**: Get immediate feedback on code issues during development
- **Prevention**: Stop vulnerable code from being committed to your repository

## Getting Started

### Prerequisites

- Git installed on your machine
- Python 3.6+ (required for pre-commit framework)

### How to use

1. Clone this repo
2. CD to the local repo where you want to set up pre-commit
3. Run `bash ./path/to/pre-commit-starter/install.sh`

The script will install the pre-commit framework, into the target repo, and configure all hooks automatically.
It will also create a file called `.pre-commit-config.yaml` in the root of your project. The `.pre-commit-config.yaml` file will contain the following:

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: <version>
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
  - repo: https://github.com/gitleaks/gitleaks
    rev: <version>
    hooks:
      - id: gitleaks
  - repo: https://github.com/standard/standard
    rev: <version>
    hooks:
      - id: standard
```

The above code is hooks for:

1. remove trailing white space at the end of lines
2. add empty line at the end of files
3. check for hardcoded secrets
4. linting javascript

## Running Hooks

Hooks run automatically on `git commit`. To run hooks manually on all files:

```bash
pre-commit run --all-files
```

## Troubleshooting

**Hooks not running?**

```bash
pre-commit install
```

**Update all hooks to latest versions:**

```bash
pre-commit autoupdate
```

## Learn More

For more information about pre-commit, visit [pre-commit.com](https://pre-commit.com)
