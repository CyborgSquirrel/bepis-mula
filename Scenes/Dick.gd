extends Sprite

func _ready():
	modulate.a = 0.5

func _process(delta):
	position -= get_global_transform_with_canvas().origin
	#This is a terrible hack to get the sprite to update when the viewport texture's size changes
	centered = false