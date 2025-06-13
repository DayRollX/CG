# CardEffect.gd
class_name CardEffect extends Resource

@export var effect_type: GameEnums.EffectType # Use the enum to identify the effect
@export var target_type: GameEnums.TargetType # What can this effect target?
@export var requires_target: bool = false # Does this effect need a target?
@export var description: String # A short description for UI or debugging

func execute(user: Node, targets: Array = []):
	# This method will be overridden by concrete effect classes
	# 'caster' could be the player, the card itself, etc.
	# 'targets' would be an array of nodes (e.g., other creatures, players)
	push_error("execute() not implemented for base CardEffect.")
