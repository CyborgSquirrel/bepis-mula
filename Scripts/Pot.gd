extends RigidBody2D

var broken_pot_sprite = preload("res://Textures/BrokenPotSprite.png")


# VARIABLES
const SPEED = 500
const BROKE_DELAY = 0.15


func _ready():
	set_physics_process(true)
	
	# TIMER INITIALIZATION
	$Timer.set_wait_time(BROKE_DELAY)
	
func _on_Timer_timeout():
	queue_free()


func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Enemies") or body.is_in_group("Pots"):
			$Sprite.set_texture(broken_pot_sprite)
			linear_velocity = Vector2(0, 0)
			angular_velocity = 0
			$Timer.start()
			body.free()