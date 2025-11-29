class Tiger from C 

	func braceEnd 

		super.braceEnd()
		if ! lTigerFile
			printSourceCode()
		ok
		if lTesting = False
			buildAndRun()	
		ok	

class c 

	cOutputFile = "myfile.c"
	cExeFile = "myfile.exe"

	cOutput = ""
	aGlobalCode = []
	aMainCode   = []

	nTabs   = 1

	lLiteralToOutput = True

	lCcode  = False
	lGlobalCode = False

	C Global

	func getC
		lCcode = True

	func getGlobal
		lGlobalCode = True

	func Header cHeader
		aGlobalCode + (`#include "` + cHeader + `"`)

	func braceStart

		aGlobalCode = []
		aMainCode   = []
		Header("stdio.h")

	func braceEnd
	
		cOutput = list2Str(aGlobalCode) + nl + nl
		cOutput += `int main(int argc, char *argv[])
{
`
		cOutput += list2Str(aMainCode) + nl
		cOutput += nl+getTabs()+`return 0;
}
`

	func braceExprEval vValue

		if lGlobalCode and vValue
			processGlobalCode(vValue)
			return
		ok

		if lCcode and vValue
			processCCode(vValue)
			return
		ok

		if lLiteralToOutput
			aMainCode + (getTabs() + `printf("` + vValue + `");`)
		ok

	func processCCode vValue
		aMainCode + formatCode(vValue)
		lCCode = False

	func processGlobalCode vValue
		aGlobalCode + formatCode(vValue)
		lGlobalCode = False

	func formatCode vValue
		aList = str2List(vValue)
		// Find minimum indentation
		nMinTab = 100
		for cLine in aList
			if trim(cLine) = "" loop ok
			nTab = 0
			while left(cLine,1) = tab
				nTab++
				cLine = substr(cLine,2)
			end
			if nTab < nMinTab nMinTab = nTab ok
		next
		
		if nMinTab = 100 nMinTab = 0 ok

		// Reconstruct with corrected indentation
		aList2 = []
		for cLine in aList
			if trim(cLine) = "" 
				aList2 + ""
				loop 
			ok
			// Remove min tabs
			for x = 1 to nMinTab
				if left(cLine,1) = tab
					cLine = substr(cLine,2)
				ok
			next
			aList2 + (getTabs() + cLine)
		next 
		return list2Str(aList2)

	func getTabs

		return copy(Tab,nTabs)

	func print cText
		aMainCode + (getTabs() + `printf("` + cText + `");`)

	func println cText
		aMainCode + (getTabs() + `printf("` + cText + `\n");`)

	func puts cText
		aMainCode + (getTabs() + `puts("` + cText + `");`)

	func input cPrompt, cVarName
		Header("stdio.h")
		# Declare variable in global
		aGlobalCode + (`char ` + cVarName + `[256];`)
		# Print prompt and read input
		aMainCode + (getTabs() + `printf("` + cPrompt + `");`)
		aMainCode + (getTabs() + `fgets(` + cVarName + `, 256, stdin);`)

	func systemCmd cCmd
		Header("stdlib.h")
		aMainCode + (getTabs() + `system("` + cCmd + `");`)

	func exitCode nCode
		Header("stdlib.h")
		aMainCode + (getTabs() + `exit(` + nCode + `);`)

	func strLen cVarName
		Header("string.h")
		return `strlen(` + cVarName + `)`

	func strCopy cDest, cSrc
		Header("string.h")
		aMainCode + (getTabs() + `strcpy(` + cDest + `, "` + cSrc + `");`)

	func strCat cDest, cSrc
		Header("string.h")
		aMainCode + (getTabs() + `strcat(` + cDest + `, "` + cSrc + `");`)

	func printSourceCode

		? cOutput

	func generateCode
		
		cOutputFile = substr(cTigerFile,".tiger",".c")
		cEXEFile = substr(cTigerFile,".tiger",".exe")
		write(cOutputFile,cOutput)

	func cleanFiles
		
		remove("buildapp.bat")

	func buildAndRun

		buildAndRunTCC()
		cleanFiles()

	func getToolsFolder
		if fexists("tools\tcc\tcc.exe")
			return "tools"
		but fexists(exefolder()+"\tools\tcc\tcc.exe")
			return exefolder()+"\tools"
		ok
		return "tools"

	func buildAndRunTCC

		generateCode()
		write("buildapp.bat",getToolsFolder()+"\tcc\tcc " + cOutputFile + " -o " + cEXEFile)
		systemSilent("buildapp.bat")
		system(cExeFile)

	func buildAndRunMSVC

		generateCode()
		if ! lTigerFile
			write("buildapp.bat",
				"call "+getToolsFolder()+"\msvc\locatevc.bat"+nl+
				"cl "+cOutputFile + " -o " + cEXEFile + nl +
				cExeFile)
			system("buildapp.bat")
		else 
			write("buildapp.bat",
				`call locatevc.bat >nul`+nl+
				"cl " + cOutputFile + " -o " + cEXEFile + " >nul")
			systemSilent("buildapp.bat")
			system(cExeFile)
		ok
	
