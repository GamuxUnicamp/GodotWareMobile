extends Sprite

export var speed = Vector2()

func _ready():
	set_process(true)

func _process(delta):
	translate(speed * delta)
	
	if get_pos().y >= get_viewport_rect().size.height:
		set_pos(Vector2(get_pos().x, -398))