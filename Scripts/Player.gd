extends KinematicBody2D

var pot = preload("res://Mini Scenes/pot.tscn")
var root
var player_sprite = preload("res://Textures/PlayerSprite.png")
var player_front_sprite = preload("res://Textures/PlayerFrontSprite.png")
var player_back_sprite = preload("res://Textures/PlayerBackSprite.png")

# VARIABLES
const SPEED = 5
const SHOOT_DELAY = 0.2

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
	
	if Input.is_action_pressed("char_right"):
		input.x = 1
		$Sprite.set_texture(player_sprite)
		$Sprite.flip_h = false
	if Input.is_action_pressed("char_left"):
		input.x = -1
		$Sprite.set_texture(player_sprite)
		$Sprite.flip_h = true
	if Input.is_action_pressed("char_down"):
		input.y = 1
		$Sprite.set_texture(player_front_sprite)
	if Input.is_action_pressed("char_up"):
		input.y = -1
		$Sprite.set_texture(player_back_sprite)
	
	velocity = input.normalized() * SPEED
	move_and_collide(velocity)

func _shoot():
	var pot_instance = pot.instance()
	pot_instance.position = position
	pot_instance.linear_velocity = get_local_mouse_position().normalized() * pot_instance.SPEED
	root.add_child(pot_instance)
	$Timer.start()

func _physics_process(delta):
	_movement()
	if Input.is_action_pressed("char_shoot") && can_shoot:
		_shoot()
		can_shoot = false
