# DealDamageEffect.gd
class_name DiscardCardPositionEffect extends CardEffect

@export var discard_amount = 1
@export var discardLeft = true

func _init():
	effect_type = GameEnums.EffectType.NONE
	description = "Discards random cards in hand"

func effect(user: Node, card, targets: Array = []):
	
	var hand = user.get_node("Hand")
	var cards = user.get_node("Hand").get_cards()
	var discardpile = user.get_node("DiscardPile")
	
	for i in discard_amount:
		hand = user.get_node("Hand")
		cards = user.get_node("Hand").get_cards()
		discardpile = user.get_node("DiscardPile")
		print(card.id)
		if(cards.size() > 1):

			cards = cards.filter(func(node): return node.id != card.id)
			var chosenCard
			if(discardLeft):
				chosenCard = cards.pop_front()
			else:
				chosenCard = cards.pop_back()

			discardpile.add_to_pile(chosenCard.cardData)
			hand.remove_card(chosenCard)
			chosenCard.remove_card()
		else:
			didFinish = false
		
