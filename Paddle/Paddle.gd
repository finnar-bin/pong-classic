extends KinematicBody2D

const MAX_SPEED = 20
const ACCELERATION = 80

export (bool) var is_player1 = true
var velocity = Vector2.ZERO
onready var player = "p1" if is_player1 else "p2"

func _process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.y = Input.get_action_strength(player + "_down") - Input.get_action_strength(player + "_up")
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta)
		
	move_and_collide(velocity)
