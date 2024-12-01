extends Area2D

@export var _timer: Timer = null


func _on_body_entered(_body: CharacterBody2D) -> void:
	_timer.start()
	_body.dead()
	#_body.velocity.y = -150
	#Engine.time_scale = 0.5
	#_body.get_node("Collision").queue_free()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
