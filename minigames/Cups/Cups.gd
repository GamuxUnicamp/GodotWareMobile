extends "res://scripts/minigame.gd"

signal minigame_end(win)

const lista_anim = ["swap_2_3", "swap_1_2", "swap_1_3"]

const pos_1 = Vector2(390,530)
const pos_2 = Vector2(960,530)
const pos_3 = Vector2(1530,530)
const pos_bola_1 = Vector2(390,630)
const pos_bola_2 = Vector2(960,630)
const pos_bola_3 = Vector2(1530,630)

var num_anim = 5

var anim_sequence = []
var pos_bola = [0,1,0]
var bola

var cond_vitoria = false
var clicou = false

var anim_counter = 0

var anim_player

func botao(qual):
	if anim_counter>=num_anim and not clicou:
		clicou = true
		pause_timer()
		bola.show()
		anim_player.play("subir_"+str(qual+1))
		if pos_bola[qual] == 1:
			cond_vitoria = true
func but_1():
	botao(0)
func but_2():
	botao(1)
func but_3():
	botao(2)

func _ready():
	
	pass
	
func _reset():
	get_node("Copo_1").set_pos(pos_1)
	get_node("Copo_2").set_pos(pos_2)
	get_node("Copo_3").set_pos(pos_3)
	pass
	
func _on_animation_end():
	_reset()
	var passada = anim_player.get_current_animation()
	if passada[1] == 'u':
		emit_signal("minigame_end", cond_vitoria)
		pass
	if passada == "descer":
		bola.hide()
		if pos_bola[0] == 1:
			bola.set_pos(pos_bola_1)
		if pos_bola[1] == 1:
			bola.set_pos(pos_bola_2)
		if pos_bola[2] == 1:
			bola.set_pos(pos_bola_3)
		
		pass
	if anim_counter < anim_sequence.size():
		anim_player.play(lista_anim[anim_sequence[anim_counter]])
		anim_counter += 1
	pass
	
func start():
	#Be sure to only enable minigame elements in this method.
	DURATION = 1.5*num_anim
	randomize()
	bola = get_node("Bola")
	anim_player = get_node("AnimationPlayer")
	anim_player.connect("finished", self, "_on_animation_end")
	anim_counter = 0
	anim_sequence = []
	get_node("Copo_1/Button").connect("pressed", self, "but_1")
	get_node("Copo_2/Button").connect("pressed", self, "but_2")
	get_node("Copo_3/Button").connect("pressed", self, "but_3")
	if difficulty == 2:
		anim_player.set_speed(1.5)
		num_anim = 8
		DURATION = 1.5*num_anim
	elif difficulty == 3:
		anim_player.set_speed(3)
		num_anim = 12
		DURATION = 1.5*num_anim
	elif difficulty == 4:
		anim_player.set_speed(6)
		num_anim = 15
		DURATION = 1.5*num_anim
	for i in range (num_anim):
		var ran = randi()%3
		anim_sequence.append(ran)
		if ran == 0:
			var swp = pos_bola[1]
			pos_bola[1] = pos_bola[2]
			pos_bola[2] = swp
		if ran == 1:
			var swp = pos_bola[0]
			pos_bola[0] = pos_bola[1]
			pos_bola[1] = swp
		if ran == 2:
			var swp = pos_bola[0]
			pos_bola[0] = pos_bola[2]
			pos_bola[2] = swp
	if difficulty == 2:
		anim_player.set_speed(2)
		DURATION /= 2
	elif difficulty == 3:
		anim_player.set_speed(4)
		DURATION /= 4
	elif difficulty == 4:
		anim_player.set_speed(8)
		DURATION /= 8
	anim_player.play("descer")
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass