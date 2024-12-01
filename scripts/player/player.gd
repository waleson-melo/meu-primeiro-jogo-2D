extends CharacterBody2D

var _alive: bool = true
var _direction: float = 1.0

@export var speed: float = 150.0
@export var jump_velocity: float = -320.0
@export var animated_sprite: AnimatedSprite2D = null


func _physics_process(delta: float) -> void:
	_apply_gravity(delta)

	if _alive:
		_run()
		_flip_sprite()
		_jump()
	_animations()

	move_and_slide()


func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


func _run():
	_direction = Input.get_axis("run_left", "run_right")
	if _direction:
		velocity.x = _direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)


func _flip_sprite():
	if _direction > 0:
		animated_sprite.flip_h = false
	elif _direction < 0:
		animated_sprite.flip_h = true


func _jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		$AudioAnimation.play("jump")


func _animations():
	if _alive:
		if is_on_floor():
			if _direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
	else:
		animated_sprite.play("dead")


func dead():
	_alive = false
	velocity.y = -300
	velocity.x = 0
	Engine.time_scale = 0.5
	$Collision.queue_free()


func _on_sprite_animation_finished() -> void:
	if animated_sprite.animation == "dead":
		set_process(false)
