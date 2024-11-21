extends Area2D

@export var _timer: Timer = null


func _on_body_entered(body: CharacterBody2D) -> void:
	_timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
