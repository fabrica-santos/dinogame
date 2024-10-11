extends Marker2D

signal speed_requested(new_speed)
signal obstacle_collided

const OBSTACLE = preload("res://scene/obstacle.tscn")

@onready var obstacle_timer: Timer = $ObstacleTimer

var is_game_running: bool = true


func _ready() -> void:
	obstacle_timer.start()
	EventBus.game_finished.connect(_on_game_finished)


func _on_obstacle_timer_timeout() -> void:
	if is_game_running == false:
		return
	var random_interval: float = randf_range(1.0, 2.0)
	obstacle_timer.stop()
	obstacle_timer.start(random_interval)
	spawn_obstacle()


func _on_game_finished() -> void:
	is_game_running = false


func spawn_obstacle() -> void:
	var _obstacle = OBSTACLE.instantiate()
	add_child(_obstacle)
	speed_requested.emit(_obstacle)
	_obstacle.collided.connect(obstacle_collided.emit)
	
