extends Node

@onready var seed_input: LineEdit = $"SeedInput"

func _ready():
	# Pre-fill with a random 7-char seed and allow user to edit
	var proposed := RandomService.generate_seed_string()
	seed_input.text = proposed


func _on_start_button_pressed():
	var user_seed := seed_input.text
	var normalized := RandomService.normalize_seed_string(user_seed)
	seed_input.text = normalized
	Gamestate.init_seed_with_string(normalized)
	Gamestate.start_new_game()
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleMain.tscn")
	pass # Replace with function body.
