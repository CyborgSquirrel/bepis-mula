extends RigidBody2D

const VELOCITY_SCALAR = 1000

func _ready():
	pass

func setup(position, rotation):
	var angle = Vector2(cos(rotation + PI / 2), sin(rotation + PI / 2))
	self.position = position + angle * 30
	self.rotation = rotation
	set_linear_velocity(angle * VELOCITY_SCALAR)

func _process(delta):
	pass
