extends Sprite

func _ready():
	modulate.a = 0.5

func _process(delta):
	position -= get_global_transform_with_canvas().origin