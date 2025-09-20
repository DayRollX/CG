# DealDamageEffect.gd
class_name RandomChoiceEffect extends CardEffect

@export var EffectsToChooseFrom: Array[CardEffect]

func _init():
	effect_type = GameEnums.EffectType.NONE
	description = "Picks a Random card Effect"

func effect(user: Node, card, targets: Array = []):
	var numberOfEffects = EffectsToChooseFrom.size()
	var chosenNumber = randi_range(0, numberOfEffects-1)
	
	EffectsToChooseFrom.get(chosenNumber).execute(user, card, targets)
		
