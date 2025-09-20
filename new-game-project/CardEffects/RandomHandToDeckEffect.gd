# DealDamageEffect.gd
class_name RandomHandToDeckEffect extends CardEffect

@export var AmountToMove = 1
@export var WholeHand = false
@export var ToBottom = true

func _init():
	requires_target = true
	description = "Moves random cards to deck"

func effect(user: Node, card, targets: Array = []):
	var hand = user.get_node("Hand")
	var cards = hand.get_cards()
	var deck = user.get_node("Deck")
	
	if WholeHand:
		AmountToMove = cards.size()
	
	for i in AmountToMove:
		hand = user.get_node("Hand")
		cards = hand.get_cards()
		cards = cards.filter(func(node): return node.id != card.id)
		deck = user.get_node("Deck")
		
		if(cards.size() > 0):
			var chosenCard = cards.pick_random()

			if(ToBottom):
				deck.add_to_bottom(chosenCard.cardData)
			else:
				deck.add_to_top(chosenCard.cardData)
			hand.remove_card(chosenCard)
			chosenCard.remove_card()
		else:
			didFinish = false
