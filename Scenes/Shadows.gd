extends Viewport

func _ready():
	size = get_tree().get_root().size
	get_tree().get_root().connect("size_changed", self, "_on_Viewport_size_changed")

func _on_Viewport_size_changed():
	size = get_tree().get_root().size