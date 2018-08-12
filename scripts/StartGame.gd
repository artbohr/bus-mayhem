extends Control

func _process(delta):
	if Input.is_action_just_pressed('ui_begin'):
		get_tree().change_scene('res://scenes/Main.tscn')