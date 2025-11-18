extends Sprite2D


func _process(delta):
	
	#rotate weapons
	var mouse_pos=get_global_mouse_position()
	var direction=mouse_pos - global_position
	
	print(mouse_pos)
	
	rotation=direction.angle()
	
	#hide weapons if they are on the opposite side as the mousee
	if mouse_pos[0]<get_parent().global_position[0]:
		visible=false
	else:
		visible=true
