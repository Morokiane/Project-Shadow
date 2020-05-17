extends Node

var diamondKey = false
var squareKey = false
var drawBridgeOpen = false

var hasLantern = false

func _process(_delta):
	if Input.is_action_just_pressed("Start"):
		get_tree().quit()

func GotLantern():
	hasLantern = true
