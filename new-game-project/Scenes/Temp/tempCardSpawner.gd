extends Node

var cardObj = preload("res://Scenes/Battle/Cards/BattleCard.tscn")
var main
var h
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	h = $"../player/Hand"
	main = $".."
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	
	print_debug("PRESSED SPAWN")
	var s = cardObj.instantiate()
	#var c = Node.new()
	#c.set_script(cards["A00001"])
	#s.createCard()
	h.add_card($"../Game/CardDatabase".get_card("A6"))

	pass # Replace with function body.
