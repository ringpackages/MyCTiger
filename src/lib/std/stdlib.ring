# stdlib.ring - Standard Library wrappers for MyCTiger

class TigerStdlib

	func exitProgram nCode
		Tiger.Header("stdlib.h")
		Tiger.aMainCode + (Tiger.getTabs() + `exit(` + nCode + `);`)

	func systemCall cCommand
		Tiger.Header("stdlib.h")
		Tiger.aMainCode + (Tiger.getTabs() + `system("` + cCommand + `");`)

