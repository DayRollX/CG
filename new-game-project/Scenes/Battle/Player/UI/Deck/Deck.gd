extends Node

var cards = []
var hand
var discardPile
var deckCount
var cardSystem
var tree
var gameStateLoop

func _ready():
	tree = get_tree()
	hand = $"../Hand"
	discardPile = $"../DiscardPile"
	deckCount = $"../DeckCount"
	cardSystem = $"../../Game/CardSystem"
	gameStateLoop = get_node("../../Game/GameStateLoop")

func set_deck(givenCards):
	cards = givenCards

func shuffle():
	cards.shuffle()



func remove_top_card():
	var card = cards.pop_front()
	deckCount.set_text(str(cards.size()))
	if(cards.size() < 1):
		if gameStateLoop:
			gameStateLoop.emit_signal("win_condition_met")
	return card
	


func draw():
	var drew = true
	print("Player draw")
	if(cards.size() > 0):
		hand.add_card(cards.pop_front())
	else:
		var gameStateLoop = get_node("../../Game/GameStateLoop")
		if gameStateLoop:
			gameStateLoop.emit_signal("win_condition_met")
		print("No More Cards!")
		drew = false
	deckCount.set_text(str(cards.size()))
	return drew
	


func discard():
	var discarded = true
	var card
	if(cards.size() > 0):
		card = cards.pop_front()
		cardSystem.useDiscardFromDeckEffect($"..",card,[])
		discardPile.add_to_pile(card)
	else:
		var gameStateLoop = get_node("../../Game/GameStateLoop")
		if gameStateLoop:
			gameStateLoop.emit_signal("win_condition_met")
		print("No cards to discard")
		discarded = false
	deckCount.set_text(str(cards.size()))
	return discarded
	
func add_to_bottom(card:Card):
	cards.push_back(card)
	deckCount.set_text(str(cards.size()))
	
func add_to_top(card:Card):
	cards.push_front(card)
	deckCount.set_text(str(cards.size()))
	
	
func scry():
	pass
