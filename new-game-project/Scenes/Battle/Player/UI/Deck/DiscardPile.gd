extends Node

var discardCount 
var cards = []

func _ready():
	print("initializing")
	discardCount = $"../DiscardCount"

func view_deck():
	print("Card View")
	for card in cards:
		print(card)

func add_to_pile(card:Card):
	cards.append(card)
	discardCount.set_text(str(cards.size()))
	pass
	
func remove(i):
	var card = cards.pop_at(i)
	discardCount.set_text(str(cards.size()))
	return card

func get_count():
	return cards.size()

func get_cards():
	return cards
