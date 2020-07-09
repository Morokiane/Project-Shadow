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
	# pass
	# if gameController.startMenu == false:
	SpawnPlayer()

func SpawnPlayer():

	var scene = load("res://scenes/Player.tscn")
	var player = scene.instance()
	add_child(player)
	print("player was created")
	
	# if gameController.start == true:
	# 	gameController.player.position = Vector2(64, 384)
	# 	gameController.start = false
		
	# else:
	# 	return
