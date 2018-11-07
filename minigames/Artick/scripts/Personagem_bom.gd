extends KinematicBody2D

const speed = 5000
const normal = Vector2(0,-1)
const gravidade = 10

var velocity = Vector2(0,0)
var pos_atual
var giro = Vector3(0,0,0)
var mouse = Vector2(0,0)
var rel = 0

func _ready():
	set_process(true)
	pass

func _process(delta):

	
	pos_atual = self.get_pos()
	if pos_atual.x > 1983:
		set_pos(Vector2(-62,pos_atual.y))
	elif pos_atual.x < -65:
		set_pos(Vector2(1918,pos_atual.y))
		
	pass