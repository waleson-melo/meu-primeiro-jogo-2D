extends Area2D

@export var _audio: AudioStreamPlayer2D = null
@export var _timer: Timer = null

@onready var _game_manager: Node = %GameManager


func _on_body_entered(_body: Node2D) -> void:
	_game_manager.add_point()
	_audio.play()
	_timer.start()


func _on_timer_timeout() -> void:
	queue_free()
