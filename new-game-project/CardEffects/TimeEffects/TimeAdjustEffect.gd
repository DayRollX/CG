# DealDamageEffect.gd
class_name TimeAdjustEffect extends CardEffect

@export var time_change_amount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func execute(user: Node, card, targets: Array = []):
	for target in targets:
		#if target is Creature: # Assuming you have a Creature node/class
		target.adjust_time(time_change_amount)
