extends Node2D

var is_held = false
var original_position: Vector2
signal used_object

var target_area: Node2D = null  # Reference to the target area
var cardSystem
var cardData

# A global flag to ensure only one object can be grabbed
static var is_any_card_being_held = false

var id
var cost:int = 2

func _ready():
	$Area2D.connect("input_event", _on_area_input_event)
	pass

func _process(delta):
	if is_held:
		# Move the object to the mouse position while grabbed
		global_position = get_global_mouse_position()

func _on_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and not is_any_card_being_held:
			# Start grabbing only if no other object is grabbed
			is_held = true
			is_any_card_being_held = true
			original_position = global_position  # Remember the original position
		elif not event.pressed and is_held:
			# Release the object
			is_held = false
			is_any_card_being_held = false
			attempt_to_use()

func attempt_to_use():
	print_debug("Checking card being used")
	print_debug(target_area)
	print_debug(target_area.global_position)
	
	if  target_area and target_area.global_position.distance_to(global_position) < 100:  # Adjust range as needed
		print_debug("You are trying use this")
		emit_signal("used_object")
		if(cardSystem.useCard(self, $".".get_node("Player"), [$".".get_node("Enemy")])):
			remove_card()
		else:
			global_position = original_position
	else:
		# Not used: allow drag-to-reorder within the hand
		var parent_hand = get_parent()
		if parent_hand and parent_hand.has_method("handle_reorder_drop"):
			parent_hand.handle_reorder_drop(self, global_position)
			# original_position is updated by the hand; refresh to snap
			refresh()
		else:
			# Fallback: return to the original position
			global_position = original_position
	pass
	
func set_target_area(area: Node2D):
	print_debug("SETTING TARGET AREA")
	target_area = area

func set_card_system(system):
	cardSystem = system
	pass
	
func set_card_original_position(pos:Vector2):
	original_position = pos
	global_position = original_position
	pass

func set_id(givenId:String):
	id = givenId

func get_cost():
	return cost
	
func refresh():
	global_position = original_position
	
func createCard(card):
	cardData = card
	print(cardData)
	updateCard()

func updateCard():
	$Name.text = str(cardData.name)
	$Description.text = str(cardData.description)
	cost = cardData.cost

func remove_card():
		get_parent().remove_card(self)
		queue_free()
