# MyCTiger Examples

This directory contains comprehensive examples demonstrating MyCTiger's features.

## Examples List

### 01_hello_world.tiger
The simplest MyCTiger program - prints "Hello, World!"

**Run:**
```bash
ring tiger.ring examples/01_hello_world.tiger
```

### 02_variables.tiger
Demonstrates how to define and use C variables in global scope.

**Key Concepts:**
- Using `Global` block for variable declarations
- Accessing variables in main code

**Run:**
```bash
ring tiger.ring examples/02_variables.tiger
```

### 03_functions.tiger
Shows how to define custom C functions outside of main.

**Key Concepts:**
- Defining functions in `Global` block
- Calling custom functions
- Recursive functions (factorial example)

**Run:**
```bash
ring tiger.ring examples/03_functions.tiger
```

### 04_loops.tiger
Demonstrates the power of Ring as a meta-language for code generation.

**Key Concepts:**
- Using Ring loops at compile-time
- Generating repetitive C code
- Compile-time calculations

**Run:**
```bash
ring tiger.ring examples/04_loops.tiger
```

### 05_wrappers.tiger
Shows how to use MyCTiger's standard library wrappers.

**Key Concepts:**
- Using `stdio` wrappers (print, println)
- Using `stdlib` wrappers (systemCall)
- Mixing wrappers with raw C code

**Run:**
```bash
ring tiger.ring examples/05_wrappers.tiger
```

## Tips

- Use `--keep-files` to inspect generated C code
- Use `--verbose` to see compilation commands
- Mix Ring meta-programming with C for maximum flexibility
