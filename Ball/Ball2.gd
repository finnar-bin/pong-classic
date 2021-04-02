extends RigidBody2D


const MAX_SPEED = 20;

var direction = Vector2(-1, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	var speed = direction.x * MAX_SPEED
	
	add_force(Vector2(0,0), Vector2(speed, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass


func _on_RigidBody2D_body_entered(body):
	print(body.name)
	match body.name:
		"Player1":
			direction.x = 1
		
		"Player2":
			direction.x = -1

