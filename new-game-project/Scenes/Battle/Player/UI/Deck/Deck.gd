extends Node

var cards = []
var hand

func _ready():
	hand = $"../Hand"

func set_deck(givenCards):
	cards = givenCards

func shuffle():
	pass


func remove_top_card():
	return cards.pop_front()
	
func draw():
	print("Player draw")
	if(cards.size() > 0):
		hand.add_card(cards.pop_front())
	else:
		print("No More Cards!")
	print("Cards left")
	print(cards.size())

	pass
	
func scry():
	pass
