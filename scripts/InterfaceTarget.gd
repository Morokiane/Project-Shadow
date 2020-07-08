extends Node2D

onready var gameController = get_node("/root/GameController")
onready var anim = $AnimationPlayer

export(String) var barrierName = ""

func _ready():

	if gameController.levelState.has(barrierName) == false:
		get(barrierName)
		barrierName = str2var (barrierName)
	else:
		anim.play("opened")

func _on_Interface_turnOn():

	anim.play("open")
	gameController.levelState[barrierName] = true

func RemoveCollision():

	$StaticBody/CollisionShape2D.disabled = true
	print(gameController.levelState)

func Light():
	$LightOccluder2D.visible = false
