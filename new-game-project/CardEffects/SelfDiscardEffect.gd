# DealDamageEffect.gd
class_name SelfDiscardEffect extends CardEffect

func _init():
	effect_type = GameEnums.EffectType.NONE
	#target_type = GameEnums.TargetType.CREATURE
	description = "Discard itself"

func execute(user: Node, targets: Array = []):
	for target in targets:
		target.remove_card()
	pass
