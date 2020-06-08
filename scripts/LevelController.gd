extends Node2D

# export(String, FILE, "*.tscn") var character = ""

onready var gameController = get_node("/root/GameController")

func _ready():
	
	if gameController.player == null:
		
		var scene = load("res://scenes/Player.tscn")
		var player = scene.instance()
		add_child(player)
