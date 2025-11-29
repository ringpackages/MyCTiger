# stdio.ring - Standard I/O wrappers for MyCTiger

class TigerStdio

	func print cText
		Tiger.aMainCode + (Tiger.getTabs() + `printf("` + cText + `");`)

	func println cText
		Tiger.aMainCode + (Tiger.getTabs() + `printf("` + cText + `\n");`)

	func puts cText
		Tiger.aMainCode + (Tiger.getTabs() + `puts("` + cText + `");`)
