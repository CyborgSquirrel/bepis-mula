extends Node2D

export(PackedScene) var entity
export(float) var delay
var root

func _ready():
	root = get_tree().get_root().get_node("Game")
	$Timer.wait_time = delay

func _on_Timer_timeout():
	var entity_instance = entity.instance()
	entity_instance.position = position
	root.add_child(entity_instance)
