extends KinematicBody2D

var velocity = Vector2(0, 0)
const VELOCITY_SCALAR = 10

func _ready():
	pass

func setup(position, rotation):
	self.position = position
	self.rotation = rotation
	velocity = Vector2(cos(rotation + PI / 2), sin(rotation + PI / 2)) * VELOCITY_SCALAR

func _process(delta):
	position += velocity
