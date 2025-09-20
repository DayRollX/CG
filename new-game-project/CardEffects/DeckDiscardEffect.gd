# DealDamageEffect.gd
class_name DeckDiscardEffect extends CardEffect

@export var discardAmount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func effect(user: Node, card, targets: Array = []):
	for discard in discardAmount:
		didFinish = user.get_node("Deck").discard() and didFinish
	
