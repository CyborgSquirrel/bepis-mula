extends TileMap

#This is terrible, but better than the alternatives

func _ready():
	var root = get_tree().get_root().get_node("Game")
	var node = root.get_node("Shadows/Foreground")
	var cells = get_used_cells()
	for cell in cells:
		node.set_cellv(cell, get_cellv(cell))
	node.modulate.a = 0.5