#!/bin/bash

set -e

# get calling directory
CALL_DIR="$(pwd)"

# function to start installing
start() {
  # run in calling directory
  cd "$CALL_DIR" || exit 1

  # initialize git
  git init
  pre_commit
}

pre_commit(){
  if ! command -v pre-commit >/dev/null 2>&1; then
    pipx install pre-commit
  fi

  if [ ! -f .pre-commit-config.yaml ]; then
  cat > .pre-commit-config.yaml <<'EOF'
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.6.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.30.0
    hooks:
      - id: gitleaks
  - repo: https://github.com/standard/standard
    rev: v17.1.2
    hooks:
      - id: standard
EOF
fi

  pre-commit install
}

pre_push(){
  echo "Setting up pre-push hook..."
}

# Call the function
start
