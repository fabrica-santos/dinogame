extends Control


func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		exit_pause()


func _on_pause_pressed() -> void:
	exit_pause()


func exit_pause() -> void:
	hide()
	get_tree().paused = false
