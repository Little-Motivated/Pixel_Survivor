extends CharacterBody2D

var bullet_scene = preload("res://Scenes/Bullets/bullet_triangle.tscn")

var player_pos = Vector2.ZERO

var can_shoot = true

func _ready():
	#$Sprites/Triangle1.position = Vector2(0, -100)
	#$Sprites/Triangle2.position = Vector2(-86.6, 40)
	#$Sprites/Triangle3.position = Vector2(86.6, 40)
	$Sprites/Triangle1.position = Vector2(0, -80)
	$Sprites/Triangle2.position = Vector2(-69.28, 32)
	$Sprites/Triangle3.position = Vector2(69.28, 32)
	
	$Tr1.position = Vector2(0, -80)
	$Tr2.position = Vector2(-69.28, 32)
	$Tr3.position = Vector2(69.28, 32)

func _process(delta):
	$Sprites/Triangle1.rotation_degrees += 50 * delta
	$Sprites/Triangle2.rotation_degrees += 50 * delta
	$Sprites/Triangle3.rotation_degrees += 50 * delta
	
	$Tr1.rotation_degrees += 50 * delta
	$Tr2.rotation_degrees += 50 * delta
	$Tr3.rotation_degrees += 50 * delta
	
	# rotation_degrees += -100 * delta
	
	if can_shoot:
		var bullet = bullet_scene.instantiate()
		#sbullet.position = global_position
		bullet.direction = (player_pos - global_position).normalized()
		bullet.rotation = position.angle_to_point(player_pos) + PI/2
		add_child(bullet)
		can_shoot = false
		$Reload.start()

func _on_player_find(pos):
	player_pos = pos


func _on_reload_timeout():
	can_shoot = true
