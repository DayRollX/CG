# DealDamageEffect.gd
class_name PlanRampEffect extends CardEffect

@export var rampAmount: int
@export var rested: bool

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func execute(user: Node, targets: Array = []):
	for ramp in rampAmount:
		user.ppup(true)
