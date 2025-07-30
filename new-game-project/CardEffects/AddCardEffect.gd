# DealDamageEffect.gd
class_name AddCardEffect extends CardEffect

var cardObj = preload("res://Scenes/Battle/Cards/BattleCard.tscn")

@export var CardIDToAdd: String
@export var Amount = 1

func _init():
	#effect_type = GameEnums.EffectType.DEAL_DAMAGE
	#target_type = GameEnums.TargetType.CREATURE
	requires_target = true
	description = "Adds a card to the target's hand"

func execute(user: Node, targets: Array = []):
	for target:Node in targets:
		for i in range(0, Amount):
			var s = cardObj.instantiate()
			#var c = Node.new()
			#c.set_script(cards["A00001"])
			#s.createCard()
			
			var hand = target.get_node("Hand")
			hand.add_card(target.get_node("../Game/CardDatabase").get_card(CardIDToAdd))
			pass
