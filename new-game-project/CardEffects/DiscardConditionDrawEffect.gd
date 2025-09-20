# DealDamageEffect.gd
class_name DiscardConditionDrawEffect extends CardEffect

@export var drawAmount: int
@export var amountInDiscard: int
@export var isGreaterCondition: bool

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	isGreaterCondition = false
	description = "Draw if discard amount is fufilled"

func effect(user: Node, card, targets: Array = []):
	if isGreaterCondition:
		if user.get_node("DiscardPile").get_count() > amountInDiscard:
			for draw in drawAmount:
				didFinish = user.get_node("Deck").draw() && didFinish
	else:
		if user.get_node("DiscardPile").get_count() < amountInDiscard:
			for draw in drawAmount:
				didFinish = user.get_node("Deck").draw() && didFinish
	
