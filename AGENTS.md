# Agent Guidelines for Blood Moon Repository

This document outlines the operational guidelines for AI agents working within the Blood Moon project.

## 1. Scope and Intent

*   Blood Moon is a personal but public repository for a Nix-based penetration testing dev shell.
*   Keep contributions practical and focused; avoid broad refactors unless explicitly requested.
*   The repository structure can evolve, so follow current files and conventions in the repo.

## 1. Build/Lint/Test Commands

*   **Environment Setup**: The primary way to interact with this project is via `nix develop`. This command sets up a reproducible development shell with all necessary tools.
*   **Build**: There are no explicit project-level build commands. Tools are managed and built by Nix.
*   **Lint/Test**: No project-level linting or testing frameworks are explicitly defined. Agents should infer linting and testing practices from individual tool configurations or existing scripts within the `nix develop` environment. For running a single test, consult the documentation of the specific tool or framework in question.

## 2. Execution Safety

*   **No Active Pentest Execution**: Do not run penetration tests or active offensive security tools.
*   **No Destructive Actions**: Do not run destructive or irreversible commands unless explicitly requested by the user.
*   **Protect Existing Work**: Do not revert, delete, or overwrite unrelated user changes.

## 3. Nix Validation and Documentation Drift

*   **When to Validate**: If `flake.nix`, `flake.lock`, any `*.nix` file in the repository root, or any file under `nix/` is modified, always attempt to run `nix flake check`.
*   **If Validation Cannot Run**: Clearly report why it could not be executed and provide the exact command for manual execution.
*   **Docs Impact Check**: If any of the files above are changed, suggest reviewing documentation (especially `README.md`) to confirm it still matches current behavior, options, and tooling.
*   **Source of Truth**: Treat repository configuration and code as authoritative when docs and implementation differ, and propose doc updates to restore alignment.

## 4. Code Style Guidelines

*   **General**: Adhere to the existing style of the files you are modifying.
*   **Nix Files (`.nix`)**: Follow the functional and declarative style prevalent in Nix expressions.
*   **Shell Scripts (`.sh`)**: Follow common shell scripting best practices.
*   **Imports**: No specific guidelines; follow existing patterns.
*   **Formatting**: No explicit formatter configured. Maintain consistency with surrounding code.
*   **Types**: No explicit type checking enforced at a project level.
*   **Naming Conventions**: Follow existing naming conventions within the specific files or modules.
*   **Error Handling**: Implement robust error handling as appropriate for the language/script.

## 5. Change Scope and Reporting

*   Keep changes minimal, scoped, and relevant to the request.
*   Avoid touching unrelated files.
*   After making changes, report what was changed and what validation was performed.

## 6. Cursor/Copilot Rules

No specific Cursor or Copilot rules are defined in this repository.
