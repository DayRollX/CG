# DealDamageEffect.gd
class_name DealDamageEffect extends CardEffect

@export var damage_amount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func execute(user: Node, targets: Array = []):
	if targets.is_empty():
		push_warning("DealDamageEffect: No targets provided.")
		return

	for target in targets:
		#if target is Creature: # Assuming you have a Creature node/class
		target.damage(damage_amount)
		print("Dealt %s damage to %s" % [damage_amount, target.name])
