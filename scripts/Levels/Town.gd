extends Node2D

onready var gameController = get_node("/root/GameController")
onready var levelController = get_node("/root/LevelController")

export var array = []

## Array 0 is to the caves

func _ready():
	
	levelController.toCaves = array[0]
	levelController.toGraveyard = array[1]
	levelController.toForest = array[2]
	
	if levelController.inCaves == true:
		gameController.player.position = levelController.leftTownAt
		print (levelController.leftTownAt)
