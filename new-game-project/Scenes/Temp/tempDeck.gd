extends Node

# Just a temporary place to create a deck on the fly 

var playerDeck

var generatedDeck = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerDeck = $"../player/Deck"

		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func makedeck():
	var temp = 0;
	for i in 50:
		temp = RandomNumberGenerator.new().randi_range(0,2)
		if temp == 0:
			generatedDeck.append($"../Game/CardDatabase".get_card("A00001"))
		elif temp == 1:
			generatedDeck.append($"../Game/CardDatabase".get_card("A00002"))
		elif temp == 2:
			generatedDeck.append($"../Game/CardDatabase".get_card("A00003"))
	playerDeck.set_deck(generatedDeck)
