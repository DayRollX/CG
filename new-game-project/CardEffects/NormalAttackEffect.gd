# DealDamageEffect.gd
class_name NormalAttackEffect extends CardEffect

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
		var damage = user.getAttackPower() - target.getBlock()
		#if target is Creature: # Assuming you have a Creature node/class
		if(damage > 0):
			for i in range(damage):
				var stop = target.damage(1)
				if stop:
					break
		print("Dealt %s damage to %s" % [damage, target.name])
