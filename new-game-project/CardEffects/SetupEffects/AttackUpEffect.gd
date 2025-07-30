# MonsterAttackUpEffect.gd
class_name AttackUpEffect extends CardEffect

@export var powerUpAmount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Deals X damage."

func execute(user: Node, targets: Array = []):
	user.powerup(powerUpAmount)
	print("powered up %s damage to %s" % [powerUpAmount, user.name])
