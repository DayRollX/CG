# DealDamageEffect.gd
class_name ChargeAbilityEffect extends CardEffect

@export var chargeAmount: int
@export var fully = false

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func effect(user: Node, card, targets: Array = []):
	if(!fully):
		user.get_node("Ability").charge_ability(chargeAmount)
	else:
		user.get_node("Ability").charge_ability_fully()
