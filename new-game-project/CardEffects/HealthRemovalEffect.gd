class_name HealthRemovalEffect extends CardEffect

@export var removal_amount: int
@export var self_applying: bool

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Removes X health."

func effect(user: Node, card, targets: Array = []):
	if(self_applying):
		user.healthRemoval(removal_amount)
		return
	
	if targets.is_empty():
		push_warning("DealDamageEffect: No targets provided.")
		return

	for target in targets:
		#if target is Creature: # Assuming you have a Creature node/class
		target.healthRemoval(removal_amount)
		print("Dealt %s damage to %s" % [removal_amount, target.name])
