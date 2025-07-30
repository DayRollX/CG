# res://scripts/card.gd
extends Resource
class_name WeaponCard
@export_category("Identity")
@export var id: String          # unique card identifier, e.g. "ATK_001"
@export var name: String
@export var description: String

@export_category("Gameplay")
@export var types: Array[String]        # e.g. ["Creature", "Elf"]
@export var power: int = 0              # only meaningful for creatures
@export var toughness: int = 0

@export var onAttackEffects: Array[CardEffect]   # list of Effects resources

@export var specialEffects: Array[CardEffect]   # list of Effects resources
