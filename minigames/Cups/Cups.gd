extends Node2D

const lista_anim = ["swap_2_3", "swap_1_2", "swap_1_3"]

var anim_sequence = [0,1,2,2,1,0]
var anim_counter = 0

var anim_player

func _play():
	anim_counter = 0
	anim_sequence = []
	for i in range (10):
		anim_sequence.append(randi()%3)
	_on_animation_end()
	pass

func _ready():
	randomize()
	anim_player = get_node("AnimationPlayer")
	anim_player.connect("finished", self, "_on_animation_end")
	get_node("Button").connect("button_down", self, "_play")
	set_process(true)
	pass
	
func _reset():
	get_node("Copo_1").set_pos(Vector2(260,360))
	get_node("Copo_2").set_pos(Vector2(640,360))
	get_node("Copo_3").set_pos(Vector2(1020,360))
	pass
	
func _on_animation_end():
	_reset()
	if anim_counter < anim_sequence.size():
		anim_player.play(lista_anim[anim_sequence[anim_counter]])
		anim_counter += 1
	pass