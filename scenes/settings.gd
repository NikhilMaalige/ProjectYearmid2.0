extends Node2D

var volume: float = 1.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn") # Replace with function body.

func _on_test_pressed():
	$audio_tester.play()  # Replace with function body.


func _on_volume_slider_value_changed(value):
	pass # Replace with function body.
