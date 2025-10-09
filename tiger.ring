load "lib/lib.ring"
load "stdlibcore.ring"

if isMainSourceFile()

	processArguments()

ok


func processArguments

	aPara = appArguments()
	if aPara and fexists(aPara[1])
		cCode = "load '" + aPara[1] + "'" + nl 
		eval(cCode)
	ok