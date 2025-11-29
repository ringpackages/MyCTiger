# string.ring - String manipulation wrappers for MyCTiger

class TigerString

	func strlen cVar
		Tiger.Header("string.h")
		return `strlen(` + cVar + `)`

	func strcpy cDest, cSrc
		Tiger.Header("string.h")
		Tiger.aMainCode + (Tiger.getTabs() + `strcpy(` + cDest + `, ` + cSrc + `);`)

	func strcmp cStr1, cStr2
		Tiger.Header("string.h")
		return `strcmp(` + cStr1 + `, ` + cStr2 + `)`
