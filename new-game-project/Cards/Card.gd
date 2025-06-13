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
@export var power: int = 0              # only meaningful for creatures
@export var toughness: int = 0

@export var effects: Array[CardEffect]   # list of Effects resources

func get_cost():
	return cost
