extends Node

var cards = []
var hand
var discardPile

func _ready():
	hand = $"../Hand"
	discardPile = $"../DiscardPile"

func set_deck(givenCards):
	cards = givenCards

func shuffle():
	cards.shuffle()


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
	
func discard():
	if(cards.size() > 0):
		discardPile.add_to_pile(cards.pop_front())
	else:
		print("No cards to discard")
	pass
func scry():
	pass
