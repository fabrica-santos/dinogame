extends Marker2D

signal speed_requested(new_speed)
signal obstacle_collided

const OBSTACLE = preload("res://scene/obstacle.tscn")

@onready var obstacle_timer: Timer = $ObstacleTimer


func _ready() -> void:
	obstacle_timer.start()


func _on_obstacle_timer_timeout() -> void:
	var random_interval: float = randf_range(1.0, 2.0)
	obstacle_timer.stop()
	obstacle_timer.start(random_interval)
	spawn_obstacle()


func spawn_obstacle() -> void:
	var _obstacle = OBSTACLE.instantiate()
	add_child(_obstacle)
	speed_requested.emit(_obstacle)
	_obstacle.collided.connect(obstacle_collided.emit)
	
