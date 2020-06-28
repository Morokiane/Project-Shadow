extends Camera2D

onready var gameController = get_node("/root/GameController")

func _ready():
	pass
	# gameController.WorldCamera = self

func _exit_tree():
	pass
	# gameController.WorldCamera = null
