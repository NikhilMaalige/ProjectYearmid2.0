extends Node2D


@onready var popup = $Window
@onready var popup2 = $Window2
@onready var popup3 = $Window3
@onready var popup4 = $Window4
@onready var popup5 = $Window5
@onready var popup6 = $Window6
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


func _on_bluebook_pressed():
	popup2.show()


func _on_window_2_close_requested():
	popup2.hide()


func _on_redbook_pressed():
	popup3.show()


func _on_window_3_close_requested():
	popup3.hide()


func _on_window_4_close_requested():
	popup4.hide()


func _on_orangebook_pressed():
	popup4.show()


func _on_porpolbook_pressed():
	popup5.show()


func _on_window_5_close_requested():
	popup5.hide()


func _on_lastbok_pressed():
	popup6.show()


func _on_window_6_close_requested():
	popup6.hide()
