extends KinematicBody2D

var direction_actions = ["char_up", "char_down", "char_left", "char_right"]
var direction_vectors = [Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0)]

var velocity = Vector2(0, 0)
const VELOCITY_SCALAR = 5

var bullet_scene = preload("res://Mini Scenes/Bullet.tscn")

func _ready():
	pass

func _update_velocity(event):
	for i in range(0, 4):
		if event.is_action_pressed(direction_actions[i]):
			velocity += direction_vectors[i] * VELOCITY_SCALAR
		elif event.is_action_released(direction_actions[i]):
			velocity -= direction_vectors[i] * VELOCITY_SCALAR

func _spawn_bullet():
	var bullet = bullet_scene.instance()
	bullet.setup(position, rotation)
	get_node("/root/Main/Bullets").add_child(bullet)

func _get_angle_to_mouse():
	var mouse_position = get_viewport().get_mouse_position()
	return get_angle_to(mouse_position) - PI / 2

func _input(event):
	_update_velocity(event)
	if event.is_action_pressed("char_shoot"):
		_spawn_bullet()

func _process(delta):
	rotate(_get_angle_to_mouse())
	position += velocity