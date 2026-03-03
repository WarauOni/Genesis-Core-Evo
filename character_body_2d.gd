extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
var speed = 500
var last_direction = "down"
var input_vector = Vector2.ZERO

func _physics_process(_delta):
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
		last_direction = "right"
	elif Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
		last_direction = "left"
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
		last_direction = "down"
	elif Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
		last_direction = "up"
	print(input_vector)

	velocity = input_vector * speed
	move_and_slide()

	## Handle animations
	#if velocity == Vector2.ZERO:
		#set_idle()  # You need to provide a direction here
		#sprite.frame = 0
		#sprite.speed_scale = 0
	#else:
	if velocity.x > 0:
		sprite.animation = "side_walk"
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.animation = "side_walk"
		sprite.flip_h = true
	elif velocity.y > 0:
		sprite.animation = "walk_down"
	elif velocity.y < 0:
		sprite.animation = "walk_up"

func set_idle():
	match last_direction:
		"up":
			sprite.play("walk_up")
		"down":
			sprite.play("walk_down")
		"left":
			sprite.play("side_walk")
			sprite.flip_h = true
		"right":
			sprite.play("side_walk")
