extends Node2D

# export(String, FILE, "*.tscn") var exitCoord = ""

onready var gameController = get_node("/root/GameController")

#these array's will hold the coordinates for the levels where the player will spawn when level is loaded
# var townSpawns = [Vector2(64, 384), Vector2(200,200)]
# var levelSpawns = [Vector2(-82.648,0)]

# var toCaves = Vector2(0,0)
# var toGraveyard = Vector2(0,0)
# var toForest = Vector2(0,0)
# var toSwamp = Vector2(0,0)

# var outOfTown = false
# var inCaves = false
# var inGraveyard = false
# var inForest = false
# var inSwamp = false

var destination = Vector2()

func _ready():

	# if gameController.startMenu == false:
	SpawnPlayer()

func SpawnPlayer():

	var scene = load("res://scenes/Player.tscn")	## When this block of code is under 
	var player = scene.instance()					## the if it breaks the transition 
	add_child(player)								## to other levels.
	print("player was created")
	
	# if gameController.start == true:
	# 	gameController.player.position = Vector2(64, 384)
	# 	gameController.start = false
		
	# else:
	# 	return
