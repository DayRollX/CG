# DealDamageEffect.gd
class_name TimeAdjustEffect extends CardEffect

@export var time_change_amount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func effect(user: Node, card, targets: Array = []):
	for target in targets:
		target.adjust_time(time_change_amount)
	
