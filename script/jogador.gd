extends CharacterBody2D

var pular: float = -320.0
var velocidade: float = 150.0
var direcao: float = 1.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	direcao = Input.get_axis("andar-esquerda", "andar-direita")
	if direcao:
		velocity.x = direcao * velocidade
	else:
		velocity.x = move_toward(velocity.x, 0, velocidade)

	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = pular

	move_and_slide()
