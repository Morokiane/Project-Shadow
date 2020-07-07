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
var canPressButton = false

export(String) var keyName = ""

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

	get(keyName)
	keyName = str2var (keyName)
	# gameController.keyName = true
	print(gameController.keys)

func _process(_area):
	if Input.is_action_just_pressed("interact") && switchOn == false && canPressButton == true:
		emit_signal("turnOn")
		anim.play("unlocked")
		switchOn = true

# these functions need to be one and generic to take any type of interacting object
func _on_ButtonRG_area_entered(_area):
	
	if gameController.keys.has(keyName):
		canPressButton = true
		print("can use")

func _on_Leverlocked_area_entered(_area):

	if gameController.keys.has(keyName) == true: #check the game controller to see if the player picked up the required key
		canPressButton = true
		print("can use")
