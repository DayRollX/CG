extends Node

var cardObj = preload("res://Scenes/Battle/Cards/BattleCard.tscn")

var cards = []

var a
var b

var tempCardId = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a = $"../../UI/PlayArea/Shape"
	b = $"../../Game/CardSystem"
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_card(givenCard:Card):
	var card = cardObj.instantiate()
	card.createCard(givenCard)
	
	card.set_card_system(b)
	card.set_target_area(a)
	card.set_id(str(tempCardId))
	card.set_card_original_position(Vector2(100+(cards.size() * 30),600))
	cards.push_back(card)
	add_child(card)
	
	tempCardId = tempCardId + 1
	pass
	
func remove_card(card:Node2D):
	print("Before removal:", get_all_ids())
	cards = cards.filter(func(node): return node.id != card.id)
	print("After removal:", get_all_ids())
	for selectedCard in range(cards.size()):
		cards[selectedCard].set_card_original_position(Vector2(100+(selectedCard * 30),600))
		cards[selectedCard].refresh()
	

func get_all_ids() -> Array:
	return cards.map(func(node): return node.id)
