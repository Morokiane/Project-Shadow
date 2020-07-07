extends Area2D

onready var gameController = get_node("/root/GameController")
export(String) var keyName = ""

func _ready():

	get(keyName)
	keyName = str2var (keyName)
	print(keyName)
	gameController.keyName = keyName
	
func _on_Key_body_entered(_body: PhysicsBody2D)->void:
	
	#print ("got it")
	gameController.keyName = true
	print (gameController.leverKey)
	# gameController.keyName = true
	queue_free()

	
