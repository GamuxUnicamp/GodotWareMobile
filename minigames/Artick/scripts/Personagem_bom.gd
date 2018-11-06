extends KinematicBody2D

const speed = 1000
const normal = Vector2(0,-1)
const gravidade = 10

var velocity = Vector2(0,0)
var pos_atual
var giro = Vector3(0,0,0)
var mouse = Vector2(0,0)
var rel = 0

func _ready():
	get_node("Button").connect("pressed",self,"clicando")
	set_process(true)
	pass

func _process(delta):
	#giro.x += Input.get_gyroscope().x
	
	if is_move_and_slide_on_floor():
		velocity = Vector2(0,0)
		if Input.is_action_pressed("clicar"):
			mouse = get_viewport().get_mouse_pos()
			rel = (-self.get_pos().x + mouse.x)
		move(Vector2(rel,0))
		pass
	velocity.y += (gravidade * delta)
	move_and_slide(velocity,normal)
	pos_atual = self.get_pos()
	if pos_atual.x > 705:
		set_pos(Vector2(-62,pos_atual.y))
	elif pos_atual.x < -65:
		set_pos(Vector2(702,pos_atual.y))
		
	pass
func clicando():
		pass