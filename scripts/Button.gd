extends Area2D

export var requiresKey = false
#export(String) var text = "Key Name"

signal turnOn

onready var gameController = get_node("/root/GameController")
onready var anim = $AnimationPlayer

var switchOn = false
var canPressButton = false
#func _ready():
#	text = str2var(text)
#	var text = text
#	print (gameController.text)

func _process(_area):
	if Input.is_action_just_pressed("interact") && switchOn == false && canPressButton == true && gameController.diamondKey == true:
		emit_signal("turnOn")
		anim.play("switch")
		switchOn = true

func _on_DiamondButton_area_entered(_area):
	canPressButton = true

