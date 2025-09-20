# DealDamageEffect.gd
class_name DeckHealEffect extends CardEffect

@export var healAmount: int

func _init():
	effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	description = "Adds top card from deck to Health"

func effect(user: Node, card, targets: Array = []):
	for eachHeal in healAmount:
		var c = user.get_node("Deck").remove_top_card()
		if c:
			user.get_node("HealthArea").add_to_top(c)
			user.update_health()
