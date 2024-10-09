extends Control


func _ready() -> void:
	hide()
	EventBus.game_finished.connect(show)


func _on_restart_button_pressed() -> void:
	EventBus.game_restarted.emit()
