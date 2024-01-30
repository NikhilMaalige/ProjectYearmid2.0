extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"overworld-day-player".play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_return_menu_pressed():
	$"overworld-day-player".stop();
	get_tree().change_scene_to_file("res://scenes/main.tscn")
