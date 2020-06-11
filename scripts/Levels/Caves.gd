extends Node2D

onready var gameController = get_node("/root/GameController")
onready var levelController = get_node("/root/LevelController")

## Array 0 is to the caves

func _ready():
	
	gameController.player.position = levelController.destination
