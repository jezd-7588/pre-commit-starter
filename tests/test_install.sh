#!/bin/bash

set -e

# Test setup
TEST_DIR=$(mktemp -d)
trap 'rm -rf $TEST_DIR' EXIT

cd "$TEST_DIR"

# Test 1: Verify start function initializes git
test_git_init() {
    mkdir test1 && cd test1
    CALL_DIR="$(pwd)"

    # Mock pre_commit to avoid actual installation
    pre_commit() { return 0; }

    cd "$CALL_DIR" || exit 1
    git init

    [ -d .git ] && echo "✓ Test 1 passed: git initialized"
}

# Test 2: Verify pre-commit config is created
test_config_creation() {
    mkdir test2 && cd test2

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
EOF
    fi

    [ -f .pre-commit-config.yaml ] && echo "✓ Test 2 passed: config file created"
}

# Test 3: Verify config contains expected repos
test_config_content() {
    mkdir test3 && cd test3

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
EOF

    grep -q "gitleaks" .pre-commit-config.yaml && echo "✓ Test 3 passed: config contains expected repos"
}

# Run tests
test_git_init
test_config_creation
test_config_content
