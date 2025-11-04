extends Sprite2D

#get vector of hand to mouse
var mouse_pos=get_viewport().get_mouse_position()


func _process(delta):
	Vector2(.get_position(),mouse_pos)
