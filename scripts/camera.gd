extends Camera2D

onready var gameController = get_node("/root/GameController")

func _ready():
	gameController.WorldCamera = self

func _exit_tree():
	gameController.WorldCamera = null
