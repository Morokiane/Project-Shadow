extends Node2D

onready var anim = $AnimationPlayer
onready var animSprite = $KinematicBody2D/AnimatedSprite

var inControl = false
var atTop = true
var canPressButton = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") && canPressButton == true && atTop == true:
		# emit_signal("turnOn")
		anim.play("down")
		animSprite.play("down")
		# #print (animSprite)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		canPressButton = true