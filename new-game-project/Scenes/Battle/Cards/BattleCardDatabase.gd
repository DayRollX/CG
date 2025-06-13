extends Node

var cards

func set_cards(givenCards):
	cards = givenCards

func get_card(id: String) -> Card:
	return cards.get(id, null)
