extends Node

func _on_game_state_loop_main_phase(player) -> void:
	if player == "player":
		$Button.show()

func _on_game_state_loop_post_main_phase(player) -> void:
	if player == "player":
		$Button.hide()


func _on_button_pressed() -> void:
	$"../player/Weapon".attack()
	pass # Replace with function body.
