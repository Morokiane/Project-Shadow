extends Area2D

onready var gameController = get_node("/root/GameController")
onready var characterController = get_node("/root/CharacterController")
onready var player = gameController.player

# export (NodePath) var currentL = null
export(String, FILE, "*.tscn") var returnLevel = ""
# var fuckoff = gameController.returnLevel

export var destination = Vector2()

var inDoor = false
var inSaveRoom = false
var exitX = 0.0
var exitY = 0.0

func _ready():

	exitX = self.position.x
	exitY = self.position.y
	
	print (exitX)

	exitX = exitX - 30.0

	print (exitX)

# func _process(_delta):
# 	if Input.is_action_just_pressed("interact") && inDoor == true:
# 		get_tree().call_group("player", "MoveTo", get_node(moveTarget).position)

func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		inDoor = true
		WriteCoords()

func _on_Door_body_exited(body):
	if body.is_in_group("player"):
		inDoor = false

func WriteCoords():

	gameController.exitSave = Vector2(exitX, exitY)
	gameController.returnLevel = returnLevel

	if gameController.inSaveRoom == false:
		characterController.destination = destination
	else:
		characterController.destination = gameController.exitSave
	# levelController.outOfTown = true
	# destination = levelController.destination
	# destination = Vector2(0,0)
	# print(destination)
	# levelController.levelSpawns = destination
	
	# if levelController.outOfTown == true:
	# 	levelController.outOfTown = false
	# else:
	# 	levelController.leftTownAt = exit
	# 	levelController.outOfTown = true

	#print(get_position_in_parent())
	# call_deferred("LoadLevel")
	# currentL = player.position

	# var get_node(currentL).playerExit = pp
	# var currentL.playerExit = player.position
	# #print (currentL)
	# gameController.player.queue_free()
	LoadLevel()

func LoadLevel():

	if gameController.inSaveRoom == false:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/levels/SaveRoom.tscn")
	else:
		gameController.inSaveRoom = false
		# warning-ignore:return_value_discarded
		get_tree().change_scene(gameController.returnLevel)
	
	# player.position = exit
