extends Node2D

@export var game_speed: float = 200

var score: int = 0


func _on_score_tick_timeout() -> void:
	score += 1
	%ScoreLabel.text = str(score).pad_zeros(5)


func _on_speed_requested(obstacle: Variant) -> void:
	obstacle.speed = game_speed
