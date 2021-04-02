extends KinematicBody2D

const MAX_SPEED = 800;

var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()

onready var ball_location = get_parent().get_node("Ball")

func _process(delta):
	if (Input.is_action_just_pressed("launch")):
		launch()
		
	var speed = direction * MAX_SPEED * delta
	var collision = move_and_collide(speed)
	
	if collision:
		var name = collision.collider.name
		var y = collision.collider_velocity.y / MAX_SPEED
	
		if name == "Player1" || name == "Player2":
			direction.x = -direction.x
			direction.y = y
		
		elif name == "WallTop" || name == "WallBottom":
			direction.y = -direction.y
		
		else:
			direction = Vector2.ZERO
			ball_location.set_position(Vector2(512, 300))
			
func launch():	
	rng.randomize()

	direction.x = -1 if not rng.randi_range(0, 1) == 0 else 1
