# CardEffect.gd
class_name CardEffect extends Resource

@export var effect_type: GameEnums.EffectType # Use the enum to identify the effect
@export var target_type: GameEnums.TargetType # What can this effect target?
@export var requires_target: bool = false # Does this effect need a target?
@export var requires_last_effect_condition: bool = false
@export var description: String # A short description for UI or debugging

var didFinish = true

func execute(user: Node, cardData, targets: Array = []):
	effect(user, cardData, targets)
	return didFinish
	
	
func effect(user: Node, cardData, targets: Array = []):
	push_error("execute() not implemented for base CardEffect.")
	
	
