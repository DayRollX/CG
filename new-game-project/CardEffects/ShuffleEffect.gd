# DealDamageEffect.gd
class_name ShuffleEffect extends CardEffect

func _init():
	effect_type = GameEnums.EffectType.NONE
	#target_type = GameEnums.TargetType.CREATURE
	description = "Shuffles hand"

func effect(user: Node, card, targets: Array = []):
	var deck = user.get_node("Deck")
	deck.shuffle()
