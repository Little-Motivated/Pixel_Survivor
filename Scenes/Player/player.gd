extends CharacterBody2D

signal shoot(pos) # Стрельба
signal find(pos) # Передача координат противнику

var can_shoot = true
var can_dash = true

var speed = 300

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("dash") and can_dash:
		can_dash = false
		speed = 1500
		$Dash/Reload.start()
		$Dash/SpeedIncrease.start()
	
	velocity = direction * speed
	
	if velocity != Vector2(0,0):
		$Sprite2D.texture = load("res://Assets/Sprites/player.png")
	else:
		$Sprite2D.texture = load("res://Assets/Sprites/player_idle.png")
	
	if direction != Vector2(0,0):
		look_at(position - direction)
	
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot.emit(global_position)
		$Shooting.start()
		can_shoot = false
	
	print(position)
	move_and_slide()
	
	find.emit(global_position)


func _on_timer_timeout():
	can_shoot = true;

func _on_dashing_timeout():
	can_dash = true

func _on_speed_increase_timeout():
	speed = 500
