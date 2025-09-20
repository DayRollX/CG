# res://scripts/card.gd
extends Resource
class_name Card
@export_category("Identity")
@export var id: String          # unique card identifier, e.g. "ATK_001"
@export var name: String
@export var description: String

@export_category("Gameplay")
@export var cost: int
@export var block: int
@export var types: Array[String]        # e.g. ["Creature", "Elf"]

@export var interactable = false

@export_category("Effects")
@export var effects: Array[CardEffect]
@export var setups: Array[CardEffect]
@export var endOfTurnEffects: Array[CardEffect]
@export var deckDiscardEffects: Array[CardEffect]

func get_cost():
	
	return cost
