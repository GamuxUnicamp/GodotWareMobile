extends Node2D

func _ready():
	get_node("Easy").connect("button_down",self,"start_game_easy")
	get_node("Medium").connect("button_down",self,"start_game_medium")
	get_node("Hard").connect("button_down",self,"start_game_hard")
	get_node("Insane").connect("button_down",self,"start_game_insane")

func start_game_easy():
	global.selected_difficulty = 1;
	get_tree().change_scene("res://scenes/session_lobby.tscn")

func start_game_medium():
	global.selected_difficulty = 2;
	get_tree().change_scene("res://scenes/session_lobby.tscn")

func start_game_hard():
	global.selected_difficulty = 3;
	get_tree().change_scene("res://scenes/session_lobby.tscn")

func start_game_insane():
	global.selected_difficulty = 4;
	get_tree().change_scene("res://scenes/session_lobby.tscn")
