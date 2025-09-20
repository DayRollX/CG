extends Node

# Just a temporary place to create a deck on the fly 

var playerDeck
var enemyDeck



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerDeck = $"../player/Deck"
	enemyDeck = $"../enemy/Deck"
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func makedeck():
	#Make_Player_Deck()
	
	Load_Player_Deck()
	pass


func Make_Player_Deck():
	var generatedDeck = []
	var temp = 0;
	for i in 50:
		temp = RandomNumberGenerator.new().randi_range(0,4)
		generatedDeck.append($"../Game/CardDatabase".get_card("A" + str(temp + 1)))
		
	generatedDeck.shuffle()
	playerDeck.set_deck(generatedDeck)
	
func Load_Player_Deck():
	var generatedDeck = []
	
	var loadedDeck = Gamestate.get_deck()
	
	for cardId in loadedDeck:
		generatedDeck.append($"../Game/CardDatabase".get_card(cardId))
	
	generatedDeck.shuffle()
	playerDeck.set_deck(generatedDeck)
