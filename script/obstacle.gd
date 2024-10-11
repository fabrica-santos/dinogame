extends Area2D

signal collided

@export var speed: float = 0


func _physics_process(delta: float) -> void:
	position.x -= speed * delta


func _on_body_entered(body: Node2D) -> void:
	collided.emit()


func set_speed(new_speed: float) -> void:
	speed = new_speed
