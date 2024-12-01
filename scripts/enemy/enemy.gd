extends CharacterBody2D

var _direction: int = 1
var _speed: float = 100

@export var _sprite: AnimatedSprite2D = null
@export var _ray_left: RayCast2D = null
@export var _ray_right: RayCast2D = null


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Flip sprite
	if _direction > 0:
		_sprite.flip_h = false
	else:
		_sprite.flip_h = true

	# Change direction
	if _ray_right.is_colliding():
			_direction = -1
	if _ray_left.is_colliding():
			_direction = 1

	velocity.x += _direction * _speed * delta

	move_and_slide()
