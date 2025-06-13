class_name PlayerCardIDUtil

extends Node

enum PLAYERCARD { 
	TEST,
	DRAW,
	PLAN,
	PRE_MAIN,
	AIN,
	POST_MAIN,
	END_TURN 
}

var PlayerCardName = {
	PLAYERCARD.TEST: "TestAttack",
	PLAYERCARD.DRAW: "TestDraw",
	PLAYERCARD.PLAN: "TestPlan"
}
	
func getCardId(id):
	return PlayerCardName.get(id)
