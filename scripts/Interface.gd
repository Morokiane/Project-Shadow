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

# export(String, FILE, "*.tscn") var requiredKey = ""
var switchOn = false
var canUse = false
export var requiresKey = false

export(String) var keyName = ""
export(String) var switchUsed = ""

""" # creates drop down list in inspector
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
			return """

func _ready():

	if gameController.switches.has(switchUsed) == false:
		get(switchUsed)
		switchUsed = str2var (switchUsed)
	else:
		anim.play("unlocked")
	# gameController.keyName = true
	

func _process(_area):
	if Input.is_action_just_pressed("interact") && switchOn == false && canUse == true:
		emit_signal("turnOn")
		anim.play("unlocked")
		switchOn = true
		gameController.switches[switchUsed] = true

# these functions need to be one and generic to take any type of interacting object
func _on_Interface_area_entered(_area):

	print("area entered")
	print(gameController.keys)
	
	if gameController.keys.has(keyName) == true && requiresKey == true:
		canUse = true
		print("can use")

# func _on_Leverlocked_area_entered(_area):

# 	if gameController.keys.has(keyName) == true: #check the game controller to see if the player picked up the required key
# 		canPressButton = true
# 		print("can use")

