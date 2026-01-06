extends CharacterBody2D

@export var speed = 400
@onready var _animated_sprite=$AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	_animated_sprite.play('idle')
