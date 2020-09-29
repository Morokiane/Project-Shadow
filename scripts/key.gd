extends Area2D

onready var gameController = get_node("/root/GameController")
export(String) var keyName = "" #allows a key to be named from inspector

func _ready():

	if gameController.keys.has(keyName) == false:
		get(keyName) #gets the name of the key from the inspector
		keyName = str2var (keyName) #converts the string to a variable
	else:
		queue_free()

func _on_Key_body_entered(_body: PhysicsBody2D)->void:
	
	gameController.keys[keyName] = true #adds the key variable to the gamecontroller array keys
	queue_free()
	print (gameController.keys)
