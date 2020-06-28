extends Node2D

onready var gameController = get_node("/root/GameController")
onready var characterController = get_node("/root/CharacterController")

# creates drop down list in inspector
enum BGCOLOR {black, darkergray, darkgray, mediumgray, test}
export(BGCOLOR) var color = BGCOLOR.test

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
	if gameController.start == false:
		gameController.player.position = characterController.destination
		print (characterController.destination)
		gameController.inSaveRoom = true
	else:
		gameController.player.position = Vector2(338, 0.994)
		gameController.start = false
		gameController.inSaveRoom = true
		SaveLoad.LoadGame()
# func ColorTest():

# 	set_modulate(Color"242424"))
