extends Node2D

var testingbool: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	$audio_tester.stop();
	get_tree().change_scene_to_file("res://scenes/main.tscn") # Replace with function body.

func _on_test_pressed():
	if testingbool:
		$audio_tester.stop();
		testingbool = false;
	else:
		$audio_tester.play();
		testingbool = true;
	# Replace with function body.

func _on_volume_slider_value_changed(value):
	pass # Replace with function body.
