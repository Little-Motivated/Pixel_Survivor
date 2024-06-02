extends Node2D

var bullet_scene = preload("res://Scenes/Bullets/bullet.tscn")

func _process(delta):
	pass

func _on_player_shoot(pos):
	var bullet = bullet_scene.instantiate()
	bullet.position = pos
	$Bullets.add_child(bullet)
