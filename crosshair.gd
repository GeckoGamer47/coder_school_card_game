extends Node2D

#Input.set_mouse_mode(1)

func _physics_process(delta):
	var mouse_pos=get_global_mouse_position()
	global_position=mouse_pos
