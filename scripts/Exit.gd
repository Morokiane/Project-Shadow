extends Area2D

onready var gameController = get_node("/root/GameController")
onready var characterSpawner = get_node("/root/CharacterSpawner")
onready var player = gameController.player

# export (NodePath) var currentL = null
export(String, FILE, "*.tscn") var levelPath = ""

export var destination = Vector2()

var inDoor = false

func _ready():
	pass
	# exit = self.position

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

	characterSpawner.destination = destination
	
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
	# warning-ignore:return_value_discarded
	get_tree().change_scene(levelPath)

	# player.position = exit
