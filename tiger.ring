Tiger = new C

Tiger {

	"Hello, World! \n"

	#=================================================
	C `
		for (int x=1 ; x <= 10 ;x++) {
			printf("%d\n",x);
		}
	`
	#=================================================
	
}

? Tiger
Tiger.buildAndRun()

class c 

	cOutput = ""
	nTabs   = 1

	lCcode  = False

	C

	func getC
		lCcode = True

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

		if lCcode and vValue
			cOutput += getTabs() + vValue
			lCCode = False
			return
		ok

		cOutput += getTabs() + `printf("` + vValue + `");` + nl


	func getTabs
		return copy(Tab,nTabs)
		
	func buildAndRun

		write("myfile.c",cOutput)
		system("cl myfile.c")
		system("myfile.exe")
	
