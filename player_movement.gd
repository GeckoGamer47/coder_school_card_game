extends CharacterBody2D

@export var speed = 400
@export var dodge_speed = 1000
@export var dodge_time = 1
@export var is_dodging = false
@export var input_direction = Vector2.ZERO
@export var dodge_direction=input_direction


func get_input():
	if Input.is_action_just_pressed('ability'):
		dodge()
	if not is_dodging:
		input_direction = Input.get_vector("left", "right", "up", "down")
		velocity = input_direction * speed
		
func dodge():
	print('enter dodge')
	print(dodge_direction)
	
	is_dodging=true
	
	dodge_direction = input_direction.normalized()
	
	$dodge_time.start()
	#when the timer ends, the below loop while stop (uncompleted)
	while true:
		velocity=dodge_direction * dodge_speed
	
	print(velocity)
	
	is_dodging=false
	
	

func _physics_process(delta):
	get_input()
	move_and_slide()
	
