extends KinematicBody2D

var pot = preload("res://Mini Scenes/pot.tscn")
var root

# VARIABLES
const SPEED = 20
const SHOOT_DELAY = 0.2
const POT_SPEED = 500

var can_shoot = null
var timer = null


func _ready():
	set_physics_process(true)
	root = get_tree().get_root().get_node("Game")
	
	can_shoot = false
	
	# TIMER INITIALIZATION
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(SHOOT_DELAY)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	timer.start()

# If timer stopped
func on_timeout_complete():
	can_shoot = true


func _movement():
	var velocity = Vector2()
	var input = Vector2()
	input.x = int(Input.is_action_pressed("char_right")) - int(Input.is_action_pressed("char_left"))
	input.y = int(Input.is_action_pressed("char_down")) - int(Input.is_action_pressed("char_up"))
	velocity = input.normalized() * SPEED
	move_and_collide(velocity)

func _shooting():
	if Input.is_action_pressed("char_shoot"):
		var pot_instance = pot.instance()
		pot_instance.position = position
		var angle = get_angle_to(get_viewport().get_mouse_position())
		pot_instance.linear_velocity = Vector2(cos(angle), sin(angle)) * POT_SPEED
		root.add_child(pot_instance)
	
	timer.start()

func _physics_process(delta):
	_movement()
	if can_shoot:
		_shooting()
		can_shoot = false
	