extends Node2D

onready var gameController = get_node("/root/GameController")
onready var levelController = get_node("/root/LevelController")

func _ready():

	gameController.player.position = levelController.toCaves
	levelController.inCaves = true
	print(levelController.leftTownAt)