extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -320.0

@export var _animated_sprite: AnimatedSprite2D = null


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("run_left", "run_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Flip the Sprite
	if direction > 0:
		_animated_sprite.flip_h = false
	elif direction < 0:
		_animated_sprite.flip_h = true

	# Play animations
	if is_on_floor():
		if direction == 0:
			_animated_sprite.play("idle")
		else:
			_animated_sprite.play("run")
	else:
		_animated_sprite.play("jump")

	move_and_slide()
