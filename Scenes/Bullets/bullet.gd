extends Area2D

var direction = Vector2.ZERO
var speed = 1800
var scatter = 5
var accuracy = deg_to_rad(randi_range(-scatter, scatter))

func _ready():
	direction = get_global_mouse_position() - position
	rotation = direction.angle()

func _process(delta):
	position += direction.normalized().rotated(accuracy) * speed * delta
