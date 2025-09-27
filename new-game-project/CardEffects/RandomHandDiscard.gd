# DealDamageEffect.gd
class_name RandomHandDiscard extends CardEffect

@export var discard_amount:int
@export var WholeHand = false

func _init():
	effect_type = GameEnums.EffectType.NONE
	description = "Discards random cards in hand"

func effect(user: Node, card, targets: Array = []):
	
	var hand = user.get_node("Hand")
	var cards = user.get_node("Hand").get_cards()
	var discardpile = user.get_node("DiscardPile")
	
	if WholeHand:
		discard_amount = cards.size()
	
	for i in discard_amount:
		hand = user.get_node("Hand")
		cards = user.get_node("Hand").get_cards()
		discardpile = user.get_node("DiscardPile")
		print(card.id)
		if(cards.size() > 1):

			cards = cards.filter(func(node): return node.id != card.id)

			var idx = RandomService.randi_range(0, cards.size() - 1)
			var chosenCard = cards[idx]

			discardpile.add_to_pile(chosenCard.cardData)
			hand.remove_card(chosenCard)
			chosenCard.remove_card()
		else:
			didFinish = false
			
		
