extends CharacterBody2D

var speed2 = 27
var player_chase = false
var player = null
@onready var animations_enemy = $Enermy1Animation

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed2
	
		var moveDirection2 = Input.get_vector("ui_left" , "ui_right", "ui_up" , "ui_down")
		velocity = moveDirection2*speed2
		
		animations_enemy.stop()
		if velocity.length() != 0:
			var direction2 = "down"
			if velocity.x <0: direction2 = "left"
			elif velocity.x > 0: direction2 = "right"
			elif velocity.y < 0: direction2 = "up"
			animations_enemy.play("enemy1_walk_" + direction2)
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
