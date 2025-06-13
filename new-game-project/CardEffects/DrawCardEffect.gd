# DealDamageEffect.gd
class_name DrawCardEffect extends CardEffect

@export var drawAmount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func execute(user: Node, targets: Array = []):
	for draw in drawAmount:
		user.get_node("Deck").draw()
