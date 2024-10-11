extends Control

@export var game_state: GameState

@onready var score_label: Label = $VBox/ScoreLabel
@onready var highscore_label: Label = $VBox/HighscoreLabel


func _ready() -> void:
	hide()
	EventBus.game_finished.connect(show)


func _on_restart_button_pressed() -> void:
	EventBus.game_restarted.emit()


func _on_visibility_changed() -> void:
	if visible == true and is_node_ready():
		score_label.text = "Score: " + str(game_state.score).pad_zeros(5)
		highscore_label.text = "Highscore: " + str(game_state.highscore).pad_zeros(5)
