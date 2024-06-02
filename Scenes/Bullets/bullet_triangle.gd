extends Area2D

@export var direction = Vector2.ZERO
var speed = 1000

func _process(delta):
	position += direction * speed * delta

