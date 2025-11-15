# MyCTiger

## Introduction

MyCTiger transforms the Ring programming language into a powerful domain-specific language (DSL) for generating and executing C programs. 

It empowers developers to enjoy the performance and efficiency of C while leveraging Ring’s expressive syntax and productivity for DSL creation. Unlike traditional approaches that embed Ring within C applications or extend the Ring VM using C code, MyCTiger reimagines Ring as a meta-language for C. 

This isn’t about runtime language integration—it’s about compile-time code generation. With MyCTiger, Ring becomes a high-level interface for producing C code, enabling direct injection of raw C and seamless use of existing C libraries without bindings.

## 🔧 Key Features of MyCTiger

• **Compile-Time Ring Execution:** Leverage Ring source code during compilation to drive C code generation.

• **Meta-Language for C:** Treat Ring as a high-level DSL for generating and structuring C programs.

• **Raw C Injection:** Seamlessly embed raw C code into the generated output for full control and flexibility.

• **Unrestricted C Integration:** Use C libraries directly—no bindings, wrappers, or runtime glue required.

## Examples

(1) Hello World program

	Tiger {
	
		"Hello, World! \n"
		
	}

(2) Using C code

	Tiger {

		C `
			printf("Hello, World! - Using C code\n");
		`

	}

(3) Using Ring code at compile-time

	Tiger {

		"Hello, World! \n"

		#=================================================
		C `
			for (int x=1 ; x <= 10 ;x++) {
				printf("%d\n",x);
			}
		`
		#=================================================

		if isWindows() 
			"I am using Windows\n"
		else
			"I am not using Windows\n"
		ok

		for t=1 to 3 
			"" + t + "- C programming is fun!\n"
		next

		for t=1 to 10 
			"t = " + t + " square = " + (t*t) + "\n"
		next
	
	}
  
