extends Area2D

onready var gameController = get_node("/root/GameController")
onready var characterController = get_node("/root/CharacterController")
onready var player = gameController.player

# export (NodePath) var currentL = null
export(String, FILE, "*.tscn") var returnLevel = ""
export var destination = Vector2()

var inDoor = false
var inSaveRoom = false
var exitX = 0.0
var exitY = 0.0
var confirmReturn = ""

func _ready():

	exitX = self.position.x
	exitY = self.position.y
	exitX = exitX - 30.0
	print (gameController.exitSave)
	
func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		inDoor = true
		WriteCoords()

func _on_Door_body_exited(body):
	if body.is_in_group("player"):
		inDoor = false

func WriteCoords():

	if gameController.inSaveRoom == false:
		gameController.returnLevel = returnLevel
		gameController.exitSave = Vector2(exitX, exitY)
		LoadLevel()
	else:
		confirmReturn = gameController.returnLevel
		print(gameController.exitSave)
		LoadLevel()

	# LoadLevel()

func LoadLevel():

	if gameController.inSaveRoom == false:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/levels/SaveRoom.tscn")
	else:
		# warning-ignore:return_value_discarded
		get_tree().change_scene(confirmReturn)
