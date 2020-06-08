extends Node2D

export(String, FILE, "*.tscn") var exitCoord = ""

onready var gameController = get_node("/root/GameController")
# var

func _ready():

	#print (gameController.player)
	
	# if gameController.player == null:
		
	var scene = load("res://scenes/Player.tscn")
	var player = scene.instance()
	add_child(player)
	print("player was created")
