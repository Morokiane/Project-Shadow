extends Area2D

onready var gameController = get_node("/root/GameController")
onready var player = gameController.player

# export (NodePath) var currentL = null
export(String, FILE, "*.tscn") var levelPath = ""
# export(String, FILE, "*.tscn") var currentLevel = ""

var inDoor = false
export var exit = Vector2(0,0)

func _ready():
	
	exit = self.position

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

	gameController.exitTo = exit
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
	print (exit)
	# player.position = exit
