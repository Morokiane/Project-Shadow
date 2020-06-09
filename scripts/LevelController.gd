extends Node2D

# export(String, FILE, "*.tscn") var exitCoord = ""

onready var gameController = get_node("/root/GameController")

var exitTo = Vector2(0,0)
var exitFrom = Vector2(0,0)

func _ready():

	exitTo = gameController.exitTo
	
	SpawnPlayer()
	
	if gameController.exitTo > Vector2(0,0):
		# SetPlayer()
		pass

func SpawnPlayer():

	var scene = load("res://scenes/Player.tscn")	## When this block of code is under 
	var player = scene.instance()					## the if it breaks the transition 
	add_child(player)								## to other levels.
	print("player was created")
	
	if gameController.start == true:
		gameController.player.position = Vector2(64, 384)
		gameController.start = false
	else:
		return

func SetPlayer():
	gameController.player.position = exitTo
