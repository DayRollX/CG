# DealDamageEffect.gd
class_name DeckDiscardEffect extends CardEffect

@export var discardAmount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func execute(user: Node, targets: Array = []):
	for target in targets:
		for discard in discardAmount:
			target.get_node("Deck").discard()
