extends Node

var _generatedDeck: Array = []
var _level: int
var _seed_string: String = ""

func init_seed_with_string(seed_str: String) -> void:
	_seed_string = seed_str
	RandomService.init_with_seed_string(seed_str)
	print_debug("[Gamestate] Seed initialized with string: " + seed_str)

func get_seed_string() -> String:
	return _seed_string
	
func _start_new_level():
	_level = 0

func _generate_deck():
	_make_player_deck()

func _make_player_deck():
	var temp = 0;
	for i in 50:
		temp = RandomService.randi_range(0,8)
		_generatedDeck.append(("T" + str(temp + 1)))

func start_new_game():
	_start_new_level()
	_generatedDeck.clear()
	_generate_deck()

func get_deck():
	return _generatedDeck
	
func get_level():
	return _level
	
func increase_level():
	_level = _level + 1
	
func remove_card(position):
	_generatedDeck.remove_at(position)
