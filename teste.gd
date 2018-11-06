extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
		velocity.y = 0
		if giro.x >0:
			if velocity.x > 0:
				velocity.x += speed*delta
			else:
				velocity.x = 500
		elif giro.x < 0:
			if velocity.x < 0:
				velocity.x -= speed*delta
			else:
				velocity.x = -500
		else:
			velocity.x = 0
