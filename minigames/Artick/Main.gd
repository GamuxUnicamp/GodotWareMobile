extends "res://scripts/minigame.gd"

var carrinho
#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

# This signal is called when the minigame finishes
signal minigame_end(win)

onready var ratio = 1

func _ready():
	pass

func _process(delta):
	pass

func start():
	#Be sure to only enable minigame elements in this method.
	ratio = OS.get_time_scale() # Ajusts character speed by increasing difficuty
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass
	
func lost():
	emit_signal("minigame_end", false)
