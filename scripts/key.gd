extends Area2D

onready var gameController = get_node("/root/GameController")
export(String) var keyName = ""

func _ready():

	if gameController.keys.has(keyName) == false:
		get(keyName)
		keyName = str2var (keyName)
	else:
		queue_free()

func _on_Key_body_entered(_body: PhysicsBody2D)->void:
	
	gameController.keys[keyName] = true
	queue_free()
	print (gameController.keys)
