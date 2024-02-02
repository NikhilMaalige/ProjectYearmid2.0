extends CharacterBody2D

class_name Player 

#signal healthChanged


@export var speed: int = 100
@onready var animations = $PlayerAnimation
@onready var effects = $Effects
@onready var hurtTimer = $hurtTimer

@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

@export var knockbackPower: int = 500

var isHurt: bool = false
var enemyCollisions = []

var health = 100

var lastAnimDirection = "down"
var isAttacking: bool = false

func _ready():
	effects.play("RESET")

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
	if !isHurt: 
		for enemyArea in enemyCollisions:
			hurtByEnemy(enemyArea)

func hurtByEnemy(area):
	currentHealth -= 3
	if currentHealth <= 0:
		get_tree().change_scene_to_file("res://scenes/loss.tscn")
		
	isHurt = true
	#healthChanged.emit()	
	
	knockback(area.get_parent().velocity)
	effects.play("hurtBlink")
	hurtTimer.start()
	await hurtTimer.timeout
	effects.play("RESET")
	isHurt = false
	print_debug(currentHealth)
		
func _on_hurt_box_area_entered(area):
	if area.name == "HitBox":
		enemyCollisions.append(area)
		
func knockback(enemyVelocity: Vector2):
	var knockbackDirection = (enemyVelocity-velocity).normalized() * knockbackPower 
	velocity = knockbackDirection
	move_and_slide()

func _on_hurt_box_area_exited(area):
	enemyCollisions.erase(area)
