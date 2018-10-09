extends KinematicBody2D

const speed = 1000
const normal = Vector2(0,-1)
const gravidade = 10

var velocity = Vector2(0,0)
var pos_atual
var giro

func _ready():
	set_process(true)
	pass

func _process(delta):
	giro = Input.get_gyroscope()
	if is_move_and_slide_on_floor():
		velocity.y = 0
		if giro.y >0:
			if velocity.x > 0:
				velocity.x += speed*delta
			elif velocity.x == 0:
				velocity.x = 500
			else:
				velocity.x = 500
		elif giro.y < 0:
			if velocity.x < 0:
				velocity.x -= speed*delta
			elif velocity.x == 0:
				velocity.x = -500
			else:
				velocity.x = -500
		else:
			velocity.x = 0
	velocity.y += (gravidade * delta)
	move_and_slide(velocity,normal)
	pos_atual = get_pos()
	if pos_atual.x > 705:
		set_pos(Vector2(-62,pos_atual.y))
	elif pos_atual.x < -65:
		set_pos(Vector2(702,pos_atual.y))
		
	pass
