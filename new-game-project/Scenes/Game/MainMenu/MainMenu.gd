extends Node


func _on_start_button_pressed():
	Gamestate.start_new_game()
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleMain.tscn")
	pass # Replace with function body.
