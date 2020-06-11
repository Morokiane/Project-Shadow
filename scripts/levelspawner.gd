extends Node2D

onready var gameController = get_node("/root/GameController")
onready var levelController = get_node("/root/LevelController")

func _ready():
	
	if gameController.start == false:
		gameController.player.position = levelController.destination
		
	else:
		gameController.player.position = Vector2(64, 384)
		gameController.start = false
