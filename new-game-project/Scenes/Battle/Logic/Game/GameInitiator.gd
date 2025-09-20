extends Node

var turnOfPlayer = ""

signal turnSignal

var playerDeck 
var playerHealth 

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_up_game():
	#Load deck
	$"../../TempDeckMaker".makedeck()
	playerDeck = $"../../player/Deck"
	playerHealth = $"../../player/HealthArea"
	
	turnOfPlayer = GameTurnDeterminer.determine_turn()
	await get_tree().create_timer(1.0).timeout
	print_debug("Draw starting cards")
	for i in range(0, 5):
		playerDeck.draw()
	
	main_loop()
	pass

func main_loop():
	
	turnSignal.emit(turnOfPlayer)
	#$"../Countdown"._start_timer()
	pass
