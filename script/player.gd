extends CharacterBody2D

@onready var collider: CollisionShape2D = $Collider

var fall_speed_multiplier: float = 1.0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		collider.scale.y = 0.5
		collider.position.y = -9.5
		fall_speed_multiplier = 4.0
	if event.is_action_released("crouch"):
		collider.scale.y = 1.0
		collider.position.y = 0
		fall_speed_multiplier = 1.0


func _physics_process(delta: float) -> void:
	velocity.y += get_gravity().y * delta * fall_speed_multiplier
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -400
	
	move_and_slide()
