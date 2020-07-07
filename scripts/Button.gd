extends Area2D

""" allows for a text string to become a variable.
export(String) var text = "Key Name"
func _ready():
	text = str2var(text)
	var text = text
	print (gameController.text) """

signal turnOn

onready var gameController = get_node("/root/GameController")
onready var anim = $AnimationPlayer

export(String, FILE, "*.tscn") var requiredKey = ""
var switchOn = false
var canPressButton = false

#key types
var diamond = false

# creates drop down list in inspector
enum KEYTYPE {none, diamond, lever, square, triangle}
export(KEYTYPE) var keyType = KEYTYPE.none

func _ready():

	match keyType:
		KEYTYPE.none:
			return

		KEYTYPE.diamond:
			diamond = true

		KEYTYPE.lever:
			return
			# var lever = true
		
		KEYTYPE.square:
			return

		KEYTYPE.triangle:
			return
	
func _process(_area):
	if Input.is_action_just_pressed("interact") && switchOn == false && canPressButton == true && gameController.keyName == true:
		emit_signal("turnOn")
		anim.play("switch")
		switchOn = true

func _on_ButtonRG_area_entered(_area):
	canPressButton = true

func Open():
	pass
