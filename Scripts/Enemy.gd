extends KinematicBody2D

const SPEED = 10
var root

func _ready():
	set_physics_process(true)
	root = get_tree().get_root().get_node("Game")

func _approach_player():
	var player = root.get_node("Player")
	var angle = get_angle_to(player.position)
	var velocity = Vector2(cos(angle), sin(angle)) * SPEED
	move_and_collide(velocity)

func _physics_process(delta):
	_approach_player()