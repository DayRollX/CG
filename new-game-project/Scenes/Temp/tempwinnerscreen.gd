extends Node


func _on_button_pressed():
	Gamestate.increase_level()
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleMain.tscn")
	pass # Replace with function body.
