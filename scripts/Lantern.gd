extends Area2D

onready var gameController = get_node("/root/GameController")

func _on_Lantern_body_entered(_body: PhysicsBody2D)->void:
	gameController.GotLantern()
	queue_free()
