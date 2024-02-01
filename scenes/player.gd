extends CharacterBody2D

class_name Player 

signal healthChanged

@export var speed: int = 100
@onready var animations = $PlayerAnimation
@onready var effects = $Effects

@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

var health = 100

var lastAnimDirection = "down"
var isAttacking: bool = false

func handleInput():
	var moveDirection = Input.get_vector("ui_left" , "ui_right", "ui_up" , "ui_down")
	velocity = moveDirection*speed
	
	if Input.is_action_just_pressed("attack"):
		animations.play("attack_" + lastAnimDirection)
		isAttacking = true
		await animations.animation_finished
		isAttacking = false
	
func updateAnimation(): 
	if isAttacking: return
	
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "down"
		if velocity.x <0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
	
		animations.play("walk_" + direction)
		lastAnimDirection = direction

func handleCollision():
	pass

func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()


func _on_hurt_box_area_entered(area):
	if area.name == "HitBox": 
		currentHealth -= 3
		print_debug(currentHealth) # Replace with function body.
