extends Node

var player

var start = true
var diamondKey = false
var squareKey = false
var drawBridgeOpen = false
var hasLantern = false
var destination = Vector2()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func GotLantern():
	hasLantern = true

func RegisterPlayer(in_player):
	player = in_player