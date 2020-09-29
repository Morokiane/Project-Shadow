 extends Node2D

onready var gameController = get_node("/root/GameController")
onready var characterSpawner = get_node("/root/CharacterSpawner")

export var playerCanDie = false
# export (Script) var gameSaveClass #allows for another script to be added to an node

# creates drop down list in inspector
enum BGCOLOR {black, darkergray, darkgray, mediumgray, test}
export(BGCOLOR) var color = BGCOLOR.black

func _ready():

	match color:
		BGCOLOR.black:
			VisualServer.set_default_clear_color(Color("000000"))

		BGCOLOR.darkergray:
			VisualServer.set_default_clear_color(Color("040404"))

		BGCOLOR.darkgray:
			VisualServer.set_default_clear_color(Color("080808"))
		
		BGCOLOR.mediumgray:
			VisualServer.set_default_clear_color(Color("242424"))

		BGCOLOR.test:
			VisualServer.set_default_clear_color(Color("258963"))
			# ColorTest()

	# VisualServer.set_default_clear_color(Color.black)
	
	if gameController.start == false && gameController.inSaveRoom == false:
		gameController.player.position = characterSpawner.destination
		# print (characterSpawn.destination)
		print ("room spawn")
		
	elif gameController.start == true && gameController.inSaveRoom == false:
		gameController.player.position = Vector2(64, 384)
		gameController.start = false
		print ("new spawn")
			
	else:
		gameController.player.position = gameController.exitSave
		gameController.inSaveRoom = false
		print ("leaving save spawn")
	
	if playerCanDie == true:
		gameController.player.canDie = true
		print (gameController.player.canDie)

# func ColorTest():

# 	set_modulate(Color"242424"))
