extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var target_area = $"../PlayArea/Shape" # Reference to your target area
	$Card.set_target_area(target_area)
	$Card2.set_target_area(target_area)
	$Card3.set_target_area(target_area)
	
	$Card.set_card_system($"../../Game/CardSystem")
	$Card2.set_card_system($"../../Game/CardSystem")
	$Card3.set_card_system($"../../Game/CardSystem")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
