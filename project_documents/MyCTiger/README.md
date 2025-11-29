# Product Roadmap: MyCTiger

## 1. Vision
MyCTiger aims to transform the Ring programming language into a powerful meta-language for C. It allows developers to write C programs using Ring's expressive syntax, enabling compile-time code generation and seamless C library integration without bindings.

## 2. Technology Stack
- **Language**: Ring (for the DSL and meta-programming).
- **Target Language**: C (C99 standard).
- **Compiler**: TCC (Tiny C Compiler) as the default backend.
- **Platform**: Windows (Primary), Linux (Future).

## 3. Constraints & Principles
- **No Node.js**: Pure Ring and C ecosystem.
- **Foundation First**: All features must be planned before implementation.
- **Intuition-First**: The DSL syntax should feel natural to Ring developers while mapping logically to C.

## 4. Functional Modules

### Module 1: Foundation & Setup
- **Goal**: Establish the project structure and documentation.
- **Status**: **Complete**.
- **Tasks**:
    - [x] Create Roadmap (This file).
    - [x] **T01.01**: Verify `tiger.ring` entry point and its connection to `src/main.ring`.
    - [x] **T01.02**: Verify `tools` directory contents (TCC existence).
    - [x] **T01.03**: Create a basic test script (`tests/hello.tiger`) to validate the current implementation manually.
    - [x] **T01.04**: Document the directory structure in a new `project_documents/MyCTiger/structure.md`.

### Module 2: Core DSL Enhancements
- **Goal**: Improve the `Tiger` and `C` classes to support more complex C generation patterns.
- **Status**: **Complete**.
- **Tasks**:
    - [x] **T02.01**: Refactor `C` class to separate global code (includes, functions) from `main` function code.
    - [x] **T02.02**: Add support for defining functions outside `main` using a new DSL command (e.g., `function` or `code`).
    - [x] **T02.03**: Add `include` method to support custom headers.
    - [x] **T02.04**: Improve indentation logic in `processCCode` and `braceExprEval`.
    - [x] **T02.05**: Create a test case `tests/functions.tiger` to verify new features.

### Module 3: Standard Library Wrappers
- **Goal**: Provide Ring-like wrappers for common C standard library functions to reduce raw C injection needs.
- **Status**: **Complete**.
- **Tasks**:
    - [x] **T03.01**: Create `src/lib/std/` directory structure.
    - [x] **T03.02**: Implement `stdio.ring` wrappers (print, println, input).
    - [x] **T03.03**: Implement `stdlib.ring` wrappers (malloc, free, exit).
    - [x] **T03.04**: Implement `string.ring` wrappers (strlen, strcpy, strcmp).
    - [x] **T03.05**: Update `lib.ring` to load standard library wrappers.
    - [x] **T03.06**: Create test cases for each wrapper library.

### Module 4: Tooling & CLI
- **Goal**: Enhance the command-line interface.
- **Status**: **Complete**.
- **Tasks**:
    - [x] **T04.01**: Add command-line flags support (`--help`, `--version`, `--keep-files`, `--compiler`).
    - [x] **T04.02**: Add compiler selection (TCC, GCC, MSVC) via command-line flag.
    - [x] **T04.03**: Add option to keep intermediate files (`.c`, `.bat`).
    - [x] **T04.04**: Improve error messages and user feedback.
    - [x] **T04.05**: Create comprehensive help documentation.

### Module 5: Testing & Examples
- **Goal**: Ensure reliability and provide learning resources.
- **Tasks**:
    - [ ] Create a test runner in Ring.
    - [ ] Add comprehensive examples for each feature.

---
*This roadmap is a living document and will be updated as the project evolves.*
