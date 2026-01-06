extends CharacterBody2D
@onready var _animated_sprite=$AnimatedSprite2D

func _processs(_delta):
	_animated_sprite.play('idle')
