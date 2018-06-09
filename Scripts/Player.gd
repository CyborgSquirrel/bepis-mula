extends KinematicBody2D

const SPEED = 20
var pot = preload("res://Mini Scenes/pot.tscn")
var root

func _ready():
	set_physics_process(true)
	root = get_tree().get_root().get_node("Game")

func _movement():
	var velocity = Vector2()
	var input = Vector2()
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity = input.normalized() * SPEED
	position += velocity

func _shooting():
	if Input.is_action_pressed("char_shoot"):
		var pot_instance = pot.instance()
		pot_instance.position = position
		var angle = get_angle_to(get_viewport().get_mouse_position())
		pot_instance.linear_velocity = Vector2(cos(angle), sin(angle)) * 1000
		root.add_child(pot_instance)

func _physics_process(delta):
	_movement()
	_shooting()