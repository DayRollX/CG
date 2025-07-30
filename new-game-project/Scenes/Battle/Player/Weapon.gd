extends Node

var weaponData
var cardSystem
var attackPower = 1

func _ready() -> void:
	cardSystem = $"../../Game/CardSystem"
	weaponData = load("res://WeaponCards/BusterSword.tres")
	pass

func get_attack_power():
	return attackPower

func set_weapon(weapon):
	weaponData = weapon

func on_attack():
	pass
	
func checkCritical():
	pass
	
func useSpecial():
	pass

func attack():
	if $"..".can_attack():
		on_attack()
		cardSystem.useWeaponCard(weaponData, $"..", [$"../../enemy"])
		$"..".used_attack()
		pass
