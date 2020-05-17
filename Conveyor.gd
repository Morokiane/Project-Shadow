extends StaticBody2D

var speed = 5
var onConveyor = false

onready var player = "res://scenes/character.tscn"

func _process(delta):
	if onConveyor == true:
		pass
		

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		onConveyor = true
	
