extends Node

var cards = []

func initialize():
	print("initializing")

func view_cards():
	for card in range(0, cards.size()):
		print(card)


func add_to_pile(card:Card, rested):
	cards.append(card)
	pass
