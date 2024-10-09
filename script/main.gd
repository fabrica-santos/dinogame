extends Node2D

@export var game_speed: float = 200

var score: int = 0:
	set(value):
		score = value
		if score % 100 == 0:
			celebrate_good_times_cmon()

var is_celebrating: bool = false

func _ready() -> void:
	EventBus.game_restarted.connect(_on_game_restarted)


func _on_score_tick_timeout() -> void:
	score += 1
	if is_celebrating:
		return
	%ScoreLabel.text = str(score).pad_zeros(5)


func _on_speed_requested(obstacle: Variant) -> void:
	obstacle.speed = game_speed


func _on_obstacle_collided() -> void:
	# Mais lógica
	EventBus.game_finished.emit()


func _on_game_restarted() -> void:
	get_tree().reload_current_scene()


func celebrate_good_times_cmon() -> void:
	is_celebrating = true
	%ScoreLabel.text = str(score).pad_zeros(5)
	await get_tree().create_timer(2.0).timeout
	is_celebrating = false
