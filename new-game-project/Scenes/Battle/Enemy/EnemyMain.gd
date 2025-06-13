extends PlayerEntity

var cardSystem

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	name = "enemy"
	update_health()
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
	
func update_health():
	$"HPLabel/HP".text = str(health)

func mainTurnPhase(target):
	if(target == name):
		cardSystem.damagePlayer()
		print_debug("Main Phase")
		endPhaseSignal.emit("")
