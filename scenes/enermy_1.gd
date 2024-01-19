extends CharacterBody2D

var speed2 = 23
var player_chase = false
var player = null
@onready var animations_enemy = $Enermy1Animation

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed2
	
		var moveDirection2 = Input.get_vector("ui_left" , "ui_right", "ui_up" , "ui_down")
		velocity = moveDirection2*speed2
		
		
		if velocity.length() != 0:
			var direction = "down"
			if velocity.x <0: direction = "left"
			elif velocity.x > 0: direction = "right"
			elif velocity.y < 0: direction = "up"
			animations_enemy.play("enemy1_walk_" + direction)
		else:
			animations_enemy.stop()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	animations_enemy.play("enemy1_walk_down")
	animations_enemy.stop()
