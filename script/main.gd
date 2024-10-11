extends Node2D

@export var game_speed: float = 300
@export var game_state: GameState


var score: int = 0:
	set(value):
		score = value
		if game_state:
			game_state.score = score
			game_state.highscore = score if score > game_state.highscore else game_state.highscore
		if score % 100 == 0:
			celebrate_good_times_cmon()

var is_celebrating: bool = false
var is_game_running: bool = true


func _ready() -> void:
	EventBus.game_restarted.connect(_on_game_restarted)


func _on_score_tick_timeout() -> void:
	if is_game_running == false:
		return
	score += 1
	if is_celebrating:
		return
	%ScoreLabel.text = str(score).pad_zeros(5)


func _on_speed_requested(obstacle: Variant) -> void:
	obstacle.speed = game_speed


func _on_obstacle_collided() -> void:
	# Mais lógica
	EventBus.game_finished.emit()
	is_game_running = false
	game_speed = 0
	get_tree().call_group("obstacle", "set_speed", game_speed)


func _on_game_restarted() -> void:
	get_tree().reload_current_scene()


func celebrate_good_times_cmon() -> void:
	is_celebrating = true
	%ScoreLabel.text = str(score).pad_zeros(5)
	await get_tree().create_timer(2.0).timeout
	is_celebrating = false
