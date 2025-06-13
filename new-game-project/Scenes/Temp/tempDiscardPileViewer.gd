extends Node

var d

func _ready() -> void:
	d = $"../player/DiscardPile"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Discard Pile:")
	for card in d.cards:
		print(card.name)
	pass # Replace with function body.
