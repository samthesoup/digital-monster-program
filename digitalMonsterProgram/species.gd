extends Node

enum LVL { # digimon's stage of evolution
	BABYI,
	BABYII,
	CHILD,
	ADULT,
	PERFECT,
	ULTIMATE
}

enum ATRBT { # digimon's data type
	DATA,
	VIRUS,
	VACCINE,
	FREE
}

enum FLD { # digimon's prefered environment
	NSP,
	DS,
	NSO,
	WG,
	ME,
	UK,
	VB,
	DR,
	JT
}



# [ name , level , attribute, fields, weight, sprite]
var digidict = {
	"bota" : ["BOTAMON", LVL.BABYI, ATRBT.FREE, [FLD.NSP, FLD.VB], 5.0, "res://botamon.png"]
} 
