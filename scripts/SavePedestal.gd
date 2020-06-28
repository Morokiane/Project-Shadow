extends Node2D

onready var anim = $AnimationPlayer

var canSave = false
var alreadySaved = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") && canSave == true && alreadySaved == false:
		anim.play("save")
		SaveLoad.SaveGame()
		alreadySaved = true

func _on_Area2D_body_entered(body):
	if body.is_in_group("player") && alreadySaved == false:
		canSave = true

