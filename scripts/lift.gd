extends Node2D

onready var gameController = get_node("/root/GameController")
onready var anim = $AnimationPlayer
onready var animSprite = $KinematicBody2D/AnimatedSprite

var inControl = false
var atTop = true
var canPressButton = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") && canPressButton == true && atTop == true:
		GoDown()
	elif Input.is_action_just_pressed("interact") && canPressButton == true && atTop == false:
		GoUp()
		# #print (animSprite)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		canPressButton = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		canPressButton = false

func GoDown():
	
	gameController.player.canJump = false
	gameController.player.canDuck = false
	canPressButton = false
	anim.play("down")
	animSprite.play("down")
	atTop = false

func GoUp():
	gameController.player.canJump = false
	gameController.player.canDuck = false
	canPressButton = false
	anim.play("up")
	animSprite.play("up")
	atTop = true

func Reset():
	# gameController.player.justJumped = false
	animSprite.play("off")
	canPressButton = false
	gameController.player.canJump = true
	gameController.player.canDuck = true