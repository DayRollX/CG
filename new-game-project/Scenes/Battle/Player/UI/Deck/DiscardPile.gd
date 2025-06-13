extends Node

var cards = []

func initialize():
	print("initializing")

func view_deck():
	print("Card View")
	for card in cards:
		print(card)

func add_to_pile(card:Card):
	cards.append(card)
	pass
