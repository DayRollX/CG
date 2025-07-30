class_name BaseHand

extends Node

var cardObj = preload("res://Scenes/Battle/Cards/BattleCard.tscn")

var cards = []

var playerArea
var cardSystem

var tempCardId = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerArea = $"../../UI/PlayArea/Shape"
	cardSystem = $"../../Game/CardSystem"
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func instant_play():
	pass

func add_card(givenCard:Card):
	pass
	
func remove_card(card:Node2D):
	pass

func get_cards():
	return cards

func get_all_ids() -> Array:
	return cards.map(func(node): return node.id)
