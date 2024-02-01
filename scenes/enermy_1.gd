extends CharacterBody2D

var speed2 = 21
var player_chase = false
var player = null
@onready var animations_enemy = $Enermy1Animation


func _physics_process(delta):
		
	if player_chase:
		position += (player.position - position)/speed2		
		
		if (player.position - position).x != 0:
			var direction = " "
			if (player.position - position).x <0: direction = "left"
			elif (player.position - position).x > 0: direction = "right"
			animations_enemy.play("enemy1_walk_" + direction)
		elif (player.position - position).y != 0:
			var direction = " "
			if (player.position.y - position.y).y < 0: direction = "up"
			if (player.position.y - position.y).y > 0: direction = "down"
			animations_enemy.play("enemy1_walk_" + direction)
		else:
			animations_enemy.stop()
	move_and_slide()
	
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	animations_enemy.play("enemy1_walk_down")
	animations_enemy.stop()
