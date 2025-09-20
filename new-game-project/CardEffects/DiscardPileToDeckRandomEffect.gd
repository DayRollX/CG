# DealDamageEffect.gd
class_name DiscardPileToDeckRandomEffect extends CardEffect

@export var amountToMove: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Draw if discard amount is fufilled"

func effect(user: Node, card, targets: Array = []):
	if user.get_node("DiscardPile").get_count() >= amountToMove:
		for amount in amountToMove:
			var deck = user.get_node("Deck")
			var discardpile = user.get_node("DiscardPile")

			var pickedcard = discardpile.remove(randi() % discardpile.get_count())
			deck.add_to_bottom(pickedcard)
	else:
		didFinish = false
		
