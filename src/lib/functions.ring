cTigerFile = ""

func testingTiger

	lTesting = True

func startTiger

	aPara = appArguments()
	
	if len(aPara) = 0
		appInfo()
		return
	ok

	# Parse command-line arguments
	parseArguments(aPara)

	# If no file specified after parsing, show help
	if cTigerFile = ""
		appInfo()
		return
	ok

	# Check if file exists
	if fexists(cTigerFile)
		if isWindows()
			cTigerFile = substr(cTigerFile,"/","\")
		ok
		lTigerFile = ( right(cTigerFile,6) = ".tiger" )
		cCode = "load '" + cTigerFile + "'" + nl 
		eval(cCode)
	else
		? "Error: File '" + cTigerFile + "' not found."
	ok

func parseArguments aPara
	
	nIndex = 1
	while nIndex <= len(aPara)
		cArg = aPara[nIndex]
		
		switch cArg
		on "--help" on "-h"
			appHelp()
			shutdown()
		on "--version" on "-v"
			appVersion()
			shutdown()
		on "--keep-files" on "-k"
			lKeepFiles = True
		on "--compiler" on "-c"
			if nIndex < len(aPara)
				nIndex++
				cCompiler = upper(aPara[nIndex])
				aCompilers = ["TCC", "GCC", "MSVC"]
				if find(aCompilers, cCompiler) = 0
					? "Error: Unknown compiler '" + aPara[nIndex] + "'"
					? "Supported compilers: TCC, GCC, MSVC"
					shutdown()
				ok
			else
				? "Error: --compiler requires a value (TCC, GCC, MSVC)"
				shutdown()
			ok
		on "--verbose"
			lVerbose = True
		other
			# Assume it's the input file
			if cTigerFile = ""
				cTigerFile = cArg
			else
				? "Error: Multiple input files specified"
				shutdown()
			ok
		off
		
		nIndex++
	end

func appInfo

	? "==========================================================================="
	? "MyCTiger version 1.0.0"
	? "2025, Mahmoud Fayed"
	? "==========================================================================="
	? "Usage: tiger <filename.tiger> [options]"
	? ""
	? "For more information, use: tiger --help"
	? "==========================================================================="

func appVersion

	? "MyCTiger version 1.0.0"
	? "2025, Mahmoud Fayed"

func appHelp

	? "==========================================================================="
	? "MyCTiger - Ring as a Meta-Language for C"
	? "==========================================================================="
	? "Usage: tiger <filename.tiger> [options]"
	? ""
	? "Options:"
	? "  -h, --help              Show this help message"
	? "  -v, --version           Show version information"
	? "  -k, --keep-files        Keep intermediate files (.c, .bat)"
	? "  -c, --compiler <name>   Select compiler (TCC, GCC, MSVC)"
	? "      --verbose           Enable verbose output"
	? ""
	? "Examples:"
	? "  tiger hello.tiger"
	? "  tiger myapp.tiger --keep-files"
	? "  tiger myapp.tiger --compiler GCC"
	? "==========================================================================="
