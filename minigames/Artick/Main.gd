extends "res://scripts/minigame.gd"

var seguindo_mouse = false
var y
#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

# This signal is called when the minigame finishes
signal minigame_end(win)

onready var ratio = 1

func _ready():
	y = get_node("Personagem").get_pos().y
	get_node("Mouse").connect("mouse_enter", self, "mouse_chegou")
	set_process(true)

	pass

func _process(delta):
	if(seguindo_mouse == true):
		get_node("Personagem").set_pos(Vector2(get_viewport().get_mouse_pos().x,y))
	pass

func start():
	#Be sure to only enable minigame elements in this method.
	ratio = OS.get_time_scale() # Ajusts character speed by increasing difficuty
	get_node("artigo1").set_process(true)
	get_node("artigo1").show()
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass
	
func lost():
	emit_signal("minigame_end", false)
func mouse_chegou():
	seguindo_mouse = true