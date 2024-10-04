extends CharacterBody2D


func _physics_process(delta: float) -> void:
	velocity.y += get_gravity().y * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -400
	
	
	
	move_and_slide()
