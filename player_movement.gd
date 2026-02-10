extends CharacterBody2D

@export var dodge_speed_mult=1.35
@export var speed = 400
@export var can_move=true
@export var is_dodging=false

@onready var _animated_sprite=$Player_animated_sprite
@onready var dodge_timer=$dodge_Timer



var dodge_direction=Vector2.ZERO

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction

func dodge_roll():
	can_move=false
	is_dodging=true
	#dodge_timer.start()
	dodge_direction=velocity.normalized()
	await get_tree().create_timer(.75).timeout
	can_move=true
	is_dodging=false
	


func _physics_process(delta):
	if can_move==true and is_dodging==false:
		if Input.is_action_just_pressed('ability'):
			dodge_roll()
		elif can_move==true:
			velocity = get_input()*speed
	else:
		velocity=dodge_direction*speed*dodge_speed_mult
	move_and_slide()
	_animated_sprite.play('idle')
