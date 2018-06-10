extends KinematicBody2D

var pot = preload("res://Mini Scenes/pot.tscn")
var root

# VARIABLES
const SPEED = 10
const SHOOT_DELAY = 0.2
#TODO: move this to pot.gd
const POT_SPEED = 500

var can_shoot = true

func _ready():
	set_physics_process(true)
	root = get_tree().get_root().get_node("Game")

# If timer stopped
func _on_Timer_timeout():
	can_shoot = true

func _movement():
	var velocity = Vector2()
	var input = Vector2()
	input.x = int(Input.is_action_pressed("char_right")) - int(Input.is_action_pressed("char_left"))
	input.y = int(Input.is_action_pressed("char_down")) - int(Input.is_action_pressed("char_up"))
	velocity = input.normalized() * SPEED
	move_and_collide(velocity)

func _shoot():
	var pot_instance = pot.instance()
	pot_instance.position = position
	var angle = get_angle_to(get_viewport().get_mouse_position())
	pot_instance.linear_velocity = Vector2(cos(angle), sin(angle)) * POT_SPEED
	root.add_child(pot_instance)
	$Timer.start()

func _physics_process(delta):
	_movement()
	if Input.is_action_pressed("char_shoot") && can_shoot:
		_shoot()
		can_shoot = false
