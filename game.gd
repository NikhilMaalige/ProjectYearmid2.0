extends Node2D


@onready var popup = $Window
# Called when the node enters the scene tree for the first time.
func _ready():
	$"overworld-day-player".play();
	popup.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_return_menu_pressed():
	$"overworld-day-player".stop();
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
	


func _on_window_close_requested():
	popup.hide()


func _on_purplebook_pressed():
	popup.show()
