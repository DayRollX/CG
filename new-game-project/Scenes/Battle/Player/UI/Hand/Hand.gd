extends BaseHand

const START_X := 100
const Y_POS := 600
const SPACING := 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerArea = $"../../UI/PlayArea/Shape"
	cardSystem = $"../../Game/CardSystem"
	
	pass # Replace with function body.

func add_card(givenCard:Card):
	var card = cardObj.instantiate()
	card.createCard(givenCard)
	
	card.set_card_system(cardSystem)
	card.set_target_area(playerArea)
	card.set_id(str(tempCardId))
	card.set_card_original_position(Vector2(START_X + (cards.size() * SPACING), Y_POS))
	cards.push_back(card)
	add_child(card)
	
	tempCardId = tempCardId + 1
	pass
	
func remove_card(card:Node2D):
	print("Before removal:", get_all_ids())
	cards = cards.filter(func(node): return node.id != card.id)
	print("After removal:", get_all_ids())
	_reposition_cards()
	
func get_cards():
	return cards

# --- Reordering support ---
func handle_reorder_drop(card: Node2D, drop_global_pos: Vector2) -> void:
	# Determine new index from drop X position and reorder the array
	var old_index := cards.find(card)
	if old_index == -1:
		return
	var new_index := _index_from_x(drop_global_pos.x)
	new_index = clamp(new_index, 0, cards.size() - 1)
	if new_index != old_index:
		cards.remove_at(old_index)
		cards.insert(new_index, card)
	_reposition_cards()

func _index_from_x(x: float) -> int:
	# Convert x into an index based on our START_X and SPACING
	var rel := x - START_X
	var idx := int(floor((rel + (SPACING/2.0)) / SPACING))
	return idx

func _reposition_cards() -> void:
	for i in range(cards.size()):
		cards[i].set_card_original_position(Vector2(START_X + (i * SPACING), Y_POS))
		cards[i].refresh()
