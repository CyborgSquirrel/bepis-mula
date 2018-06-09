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
	if Input.is_action_just_pressed("char_shoot"):
		root.add_child(pot.instance())
		pass
	pass

func _physics_process(delta):
	_movement()
	_shooting()