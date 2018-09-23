# this script implements ship's behaviour

extends Area2D

# stores the necessary scenes
const scn_laser = preload('res://minigames/SpaceShooter/scenes/Laser_Ship.tscn')
const scn_explosion = preload('res://minigames/SpaceShooter/scenes/Explosion.tscn')
const scn_flash = preload('res://minigames/SpaceShooter/scenes/Flash.tscn')

# declare movement variables.
var ACC = -75 # value to increase speed every frame if ship is in movement
var speed = Vector2() # amount to increase/decrease from position every frame

# export ship's armor (life)
export var armor = 1 setget set_armor

# first function called (just one time)
func _ready():
	add_to_group('Ship') # add to Ship group
	shoot() # allows player to start shooting

# called every frame
func _process(delta):
	
	if get_pos().x <= 16:
		speed.x = 0.1
	elif get_pos().x >= global.view_size.width-16:
		speed.x = -0.1
	else:
		speed.x = Input.get_accelerometer().x * ACC * delta
		
	translate(speed)

# allows player to shoot
func shoot():
	yield(global.create_timer(1.5), 'timeout')
	
	while true: # infinite loop
		# get both cannons position
		var pos_left = get_node('Cannons/Cannon_Left').get_global_pos()
		var pos_right = get_node('Cannons/Cannon_Right').get_global_pos()
		
		create_laser(pos_left)
		create_laser(pos_right)
		
		# wait shoot delay time in seconds
		yield(global.create_timer(0.5), 'timeout')
	
# creates laser
func create_laser(pos):
	var laser = scn_laser.instance() # instanciate scn_laser
	
	laser.set_pos(pos) # set laser's position to given parameter
	laser.speed = Vector2(0, -laser.speed.y)
	
	global.main_node.add_child(laser) # add to main_node
	
# updates armor value when it's damaged
func set_armor(new_value):
	if new_value < armor: # if ship got damaged...
		global.main_node.get_node('Audio_Player').play('hit_ship') # play hit_ship sound
		global.main_node.add_child(scn_flash.instance()) # flash the view
	
	armor = new_value # armor is set to the given parameter
	
	if armor <= 0: # if it's armor (life) is 0 or less...
		create_explosion() # create explosion
		queue_free() # delete the ship node

# creates explosion effect
func create_explosion():
	var explosion = scn_explosion.instance() # instanciate scn_explosion
	explosion.set_pos(get_pos()) # set the effect position to enemy's position
	global.main_node.add_child(explosion) # add it to main node
