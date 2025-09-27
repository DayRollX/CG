# TimeFreezeEffect.gd
class_name TimeFreezeEffect extends CardEffect

@export var freeze_duration: int = 5 # seconds

func _init():
	effect_type = GameEnums.EffectType.NONE
	description = "Freezes time for a set duration."

func effect(user: Node, card, targets: Array = []):
	for target in targets:
		target.freeze_time(freeze_duration)
