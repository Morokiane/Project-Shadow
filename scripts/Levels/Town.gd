extends Node2D

onready var gameController = get_node("/root/GameController")
onready var levelController = get_node("/root/LevelController")

export var entry = []

## Array 0 is to the caves

func _ready():
	
	levelController.toCaves = entry[0]
	levelController.toGraveyard = entry[1]
	levelController.toForest = entry[2]
	
	if levelController.inCaves == true:
		gameController.player.position = levelController.leftTownAt
		print (levelController.leftTownAt)
