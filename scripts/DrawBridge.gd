extends Node2D

onready var gameController = get_node("/root/GameController")
onready var anim = $AnimationPlayer

func _ready():
	if gameController.drawBridgeOpen == true:
		_on_ButtonRG_turnOn()

func _on_ButtonRG_turnOn():
	anim.play("open")
	$LightOccluder2D.visible = false
