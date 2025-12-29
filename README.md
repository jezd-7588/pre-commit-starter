# Pre-commit Starter

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

The script will install the pre-commit framework and configure all hooks automatically.

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
