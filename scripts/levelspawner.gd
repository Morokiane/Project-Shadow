extends Node2D

onready var gameController = get_node("/root/GameController")
onready var levelController = get_node("/root/LevelController")

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
			ColorTest()

	# VisualServer.set_default_clear_color(Color.black)
	
	if gameController.start == false:
		gameController.player.position = levelController.destination
		print (levelController.destination)
		
	else:
		gameController.player.position = Vector2(64, 384)
		gameController.start = false

func ColorTest():

	set_modulate(Color"242424"))
