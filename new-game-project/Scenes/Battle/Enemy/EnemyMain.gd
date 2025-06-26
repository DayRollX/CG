extends PlayerEntity

var cardSystem

var attackPower:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	name = "enemy"
	update_health()
	update_attack()
	cardSystem = $"../Game/CardSystem"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage(damageAmount):
	health -= damageAmount
	update_health()
	
func heal(healAmount):
	health += healAmount
	update_health()
	
func attack(amount):
	attackPower = attackPower + amount
	update_attack()
	
func update_health():
	$"HPLabel/HP".text = str(health)
	
func update_attack():
	$DamageLabel/Damage.text = str(attack)
	
func reset_attack():
	attackPower = 0
	$DamageLabel/Damage.text = str(attack)

func mainTurnPhase(target):
	print_debug("Main Phase")
	
	if(target == name):
		var chosenNumber = 4#randi() % 2
		if chosenNumber == 4:
			attack(1)
			endPhaseSignal.emit("interact")
			#cardSystem.damagePlayer()
		else:
			print_debug("Main Phase")
			endPhaseSignal.emit("")

func interactPhase(target):
	if(target == name):
		print_debug("Interact Phase Override enemy")
		#endPhaseSignal.emit("")
		
func interactResultPhase(target):
	if(target == name):
		
		print_debug("Interact Result Phase Override enemy")
		endPhaseSignal.emit("end enemy main")
		
		reset_attack()
