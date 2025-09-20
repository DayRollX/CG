extends Node

var d
var e

func _ready() -> void:
	d = $"../player/DiscardPile"
	e = $"../enemy/DiscardPile"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Discard Pile (Player):")
	for card in d.cards:
		print(card.name)


	pass # Replace with function body.
