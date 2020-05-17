extends Area2D

onready var gameController = get_node("/root/GameController")

func _on_Key_body_entered(_body: PhysicsBody2D)->void:
	
	print ("got it")
	gameController.diamondKey = true
	queue_free()
