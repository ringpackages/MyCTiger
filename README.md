# MyCTiger

## 📜 Introduction

MyCTiger transforms the Ring programming language into a powerful domain-specific language (DSL) for generating and building C programs. 

It empowers developers to enjoy the performance and efficiency of C while leveraging Ring's expressive syntax and productivity for DSL creation. Unlike traditional approaches that embed Ring within C applications or extend the Ring VM using C code, MyCTiger reimagines Ring as a meta-language for C. 

This isn't about runtime language integration—it's about compile-time code generation. With MyCTiger, Ring becomes a high-level interface for producing C code, enabling direct injection of raw C and seamless use of existing C libraries without bindings.

## 🎉 Key Features of MyCTiger

• **Compile-Time Ring Execution:** Leverage Ring source code during compilation to drive C code generation.

• **Meta-Language for C:** Treat Ring as a high-level DSL for generating and structuring C programs.

• **Raw C Injection:** Seamlessly embed raw C code into the generated output for full control and flexibility.

• **Unrestricted C Integration:** Use C libraries directly—no bindings, wrappers, or runtime glue required.

• **Global Code & Functions:** Define custom C functions and global variables outside of main using the `Global` block.

• **Standard Library Wrappers:** Use Ring-like wrappers for common C functions (stdio, stdlib, string).

• **Multiple Compiler Support:** Choose between TCC (default), GCC, or MSVC.

• **Flexible CLI:** Command-line options for keeping files, verbose output, compiler selection, and more.

## 🔧 Development Status

This project has been enhanced with additional features including:
- Global code and custom function support
- Standard library wrappers for easier C programming
- Advanced command-line interface with multiple options
- Support for multiple C compilers (TCC, GCC, MSVC)

Development and testing are performed using MS-Windows, Ring 1.24, and TCC (included in the Tools folder).

To build Tiger.exe, run `build.bat` after installing the Ring programming language.

## 🚀 Usage

```bash
tiger <filename.tiger> [options]
```

Or when running from source:

```bash
ring tiger.ring <filename.tiger> [options]
```

### Command-Line Options

- `-h, --help` - Show help message with all available options
- `-v, --version` - Display version information
- `-k, --keep-files` - Keep intermediate files (.c, .bat) for inspection
- `-c, --compiler <name>` - Select compiler: TCC (default), GCC, or MSVC
- `--verbose` - Enable verbose output to see compilation commands

### Usage Examples

```bash
# Basic usage (using TCC by default)
ring tiger.ring examples/01_hello_world.tiger

# Keep generated C files for inspection
ring tiger.ring myapp.tiger --keep-files

# Use GCC compiler instead of TCC
ring tiger.ring myapp.tiger --compiler GCC

# Verbose mode to see compilation details
ring tiger.ring myapp.tiger --verbose

# Combine multiple options
ring tiger.ring myapp.tiger --keep-files --verbose --compiler MSVC
```

### Output Files

- `<filename>.c` - Generated C source code
- `<filename>.exe` - Compiled executable (Windows)
- `buildapp.bat` - Build script (kept only with --keep-files)

## 📚 Quick Start Examples

### (1) Hello World

```ring
Tiger {
	"Hello, World!\n"
}
```

**Run:** `ring tiger.ring examples/01_hello_world.tiger`

**Output:** `Hello, World!`

### (2) Using Raw C Code

```ring
Tiger {
	C ` printf("Hello from C!\n"); `
}
```

### (3) Defining Custom Functions

```ring
Tiger {
	Global `
		void greet(char* name) {
			printf("Hello, %s!\n", name);
		}
	`
	
	C `greet("MyCTiger");`
}
```

### (4) Using Ring Loops for Code Generation

```ring
Tiger {
	for i = 1 to 10
		"Number: " + i + "\n"
	next
}
```

### (5) Using Standard Library Wrappers

```ring
Tiger {
	stdio.println("Using stdio wrapper!")
	stdlib.systemCall("echo This is easy!")
}
```

## 📖 More Examples

Check the `examples/` directory for comprehensive examples:
- `01_hello_world.tiger` - Basic hello world
- `02_variables.tiger` - Working with C variables
- `03_functions.tiger` - Defining custom functions
- `04_loops.tiger` - Using Ring loops for code generation
- `05_wrappers.tiger` - Using standard library wrappers

Each example includes detailed comments and demonstrates different features of MyCTiger.

## 🏗️ Project Structure

```
MyCTiger/
├── src/
│   ├── main.ring           # Entry point
│   └── lib/
│       ├── classes.ring    # Core DSL classes (Tiger, C)
│       ├── functions.ring  # CLI and startup functions
│       ├── globals.ring    # Global variables and instances
│       └── std/            # Standard library wrappers
│           ├── stdio.ring
│           ├── stdlib.ring
│           └── string.ring
├── examples/               # Example .tiger files
├── tests/                  # Test files
├── tools/                  # C compilers (TCC, MSVC)
├── tiger.ring              # Main executable script
└── build.bat               # Build script for tiger.exe
```

## 🔑 DSL Reference

### Main Block

```ring
Tiger {
	# Your code here
}
```

### String Literals (Auto printf)

```ring
Tiger {
	"This will be printed\n"
}
```

### Raw C Code

```ring
Tiger {
	C `
		int x = 10;
		printf("x = %d\n", x);
	`
}
```

### Global Code (Functions & Variables)

```ring
Tiger {
	Global `
		int counter = 0;
		
		void increment() {
			counter++;
		}
	`
}
```

### Custom Headers

```ring
Tiger {
	Header("stdlib.h")
	Header("math.h")
}
```

### Standard Library Wrappers

```ring
Tiger {
	# stdio wrappers
	stdio.print("text")
	stdio.println("text with newline")
	
	# stdlib wrappers
	stdlib.systemCall("command")
	stdlib.exitProgram(0)
	
	# string wrappers (return values for use in C code)
	C `int len = ` + string.strlen("myvar") + `;`
}
```

# 📜 License 

The MyCTiger project is distributed under the MIT License.