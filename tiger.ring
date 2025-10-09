load "lib/lib.ring"
load "stdlibcore.ring"

if isMainSourceFile()

	processArguments()

ok


func processArguments

	aPara = appArguments()
	if aPara and fexists(aPara[1])
		lTigerFile = ( right(aPara[1],6) = ".tiger" )
		cCode = "load '" + aPara[1] + "'" + nl 
		eval(cCode)
	ok