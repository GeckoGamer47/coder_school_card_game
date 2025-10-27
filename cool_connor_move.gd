extends Node
var speed=50
func _physics_process(delta):
	if Input.is_action_pressed("right"):
		self.position.x += speed * delta
