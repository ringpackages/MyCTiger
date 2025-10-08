Tiger = new C

Tiger {

	"Hello, World! \n"
	
}

? Tiger 

Tiger.buildAndRun()

class c 

	cOutput = ""

	func braceStart

		cOutput += `
#include "stdio.h"
int main(int argc, char *argv[])
{
`

	func braceEnd
	
		cOutput += `
	return 0;
}
`

	func braceExprEval vValue

		cOutput += `printf("` + vValue + `");` + nl

		
	func buildAndRun

		write("myfile.c",cOutput)
		system("cl myfile.c")
		system("myfile.exe")
	