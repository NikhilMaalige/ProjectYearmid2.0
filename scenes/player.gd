extends CharacterBody2D

@export var speed: int = 100
@onready var animations = $PlayerAnimation
var health = 100

func handleInput():
	var moveDirection = Input.get_vector("ui_left" , "ui_right", "ui_up" , "ui_down")
	velocity = moveDirection*speed
	
	
func updateAnimation(): 
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "down"
		if velocity.x <0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
	
		animations.play("walk_" + direction)

func handleCollision():
	

func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
