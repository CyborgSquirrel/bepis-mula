extends KinematicBody2D

const SPEED = 20

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var velocity = Vector2()
	var input = Vector2()
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity = input.normalized() * SPEED
	position += velocity