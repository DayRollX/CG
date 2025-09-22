extends Node

var assets

var cardSets = [
	"res://Cards/TestCards",
	"res://Cards/MonsterCards/Flame",
	"res://Cards/MonsterCards",
	"res://Cards/PlayerCards/Set1",
	"res://Cards/PlayerCards/Set2",
	"res://Cards/CommonCards"
]

	
# Called when the node enters the scene tree for the first time.
func _ready():
	_loadAssets({
		"stage": "res://Scenes/Battle/Stages/BasicStage.tscn"
	})
	$Game/CardDatabase.set_cards(load_all_cards())
	$Game/GameInitiator.set_up_game()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_all_cards() -> Dictionary:
	var cards = {}
	for cardSet in cardSets:
		for cardFileName in DirAccess.get_files_at(cardSet):
			if (cardFileName.get_extension() == "tres"):
				print(cardFileName)
				var c = load(cardSet+"/"+cardFileName) as Card
				print("Card being loaded: ")
				print(c.id)
				cards[c.id] = c
	return cards


func _loadAssets(loadingAssets:Dictionary):
	assets = loadingAssets
	
	for key in assets:
		var path = assets[key]
		if path:
			var resource = load(path)
			if resource:
				assets[key] = resource
				print("Loaded asset for:", key)
				print(assets[key])
				var instance = assets[key].instantiate()
				if(key == "stage"):
					instance.position = Vector2(0, 0)

				self.add_child(instance)
				
			else:
				print("Failed to load asset for:", key)
		else:
			print("No path specified for:", key)
		
		
