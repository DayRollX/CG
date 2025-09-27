# TimeFreezeEffect.gd
class_name TimeFreezeEffect extends CardEffect

@export var freeze_duration: int = 5 # seconds

func _init():
	effect_type = GameEnums.EffectType.NONE
	description = "Freezes time for a set duration."

func execute(user: Node, card, targets: Array = []):
	# Assuming targets[0] is the timer node (ProgressBar)
	#if targets.size() > 0 and targets[0].has_method("freeze_time"):
	for target in targets:
		target.freeze_time(freeze_duration)
