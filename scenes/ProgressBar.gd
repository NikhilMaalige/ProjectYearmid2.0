extends ProgressBar

@export var player: Player

func _ready():
	#player.healthChanged.connect(update)
	#update()
	pass

func update(): 
	value = player.currentHealth * 100 / player.maxHealth

