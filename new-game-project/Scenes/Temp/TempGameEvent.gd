extends Node

var playerDeck
var pickedCard

var cardlist = {
	"T1":"Blast",
	"T2":"Forward",
	"T3":"Accelerate",
	"T4":"Gear Shift",
	"T5":"Undo",
	"T6":"Recall",
	"T7":"Quick Fix",
	"T8":"Charge",
	"T9":"Left Handed",
	"T10":"Right Handed",
}

func _ready():
	Gamestate.start_new_game()
	
	playerDeck = Gamestate.get_deck()
	var amountOfCards = playerDeck.size()-1
	pickedCard = randi_range(0, amountOfCards)
	
	
	
	$Label.text = $Label.text.replace("%card_id%", cardlist[playerDeck[pickedCard]])
	pass

func _on_button_pressed():
	Gamestate.remove_card(pickedCard)
	print("done")
	
	pass # Replace with function body.


func _on_button_2_pressed():
	pass # Replace with function body.
