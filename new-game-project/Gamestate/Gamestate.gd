extends Node

var _generatedDeck: Array = []
var _level: int
	
func _start_new_level():
	_level = 1

func _generate_deck():
	_make_player_deck()

func _make_player_deck():
	var temp = 0;
	for i in 50:
		temp = RandomNumberGenerator.new().randi_range(0,9)
		_generatedDeck.append(("T" + str(temp + 1)))

func start_new_game():
	_generatedDeck.clear()
	_generate_deck()

func get_deck():
	return _generatedDeck
	
func get_level():
	return _level
