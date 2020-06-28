extends Node
onready var gameController = get_node("/root/GameController")
"""
	this is a test comment
	to see if this is how you do multiple line
"""
var isLoading = false
const saveDir = "user://saves/"
var savePath = saveDir + "save.txt"

func SaveGame():

	var dir = Directory.new()
	if !dir.dir_exists(saveDir):
		dir.make_dir_recursive(saveDir)

	var file = File.new()
	var data = gameController.Save()
	var error = file.open(savePath, File.WRITE)
	# var error = file.open_encrypted_with_pass(savePath, File.WRITE, OS.get_unique_id())
	if error == OK:
		file.store_var(data)
		file.close()

func LoadGame():
	var file = File.new()
	# var data = gameController.Load()
	if file.file_exists(savePath):
		var error = file.open(savePath, File.READ)
		if error == OK:
			var data = file.get_var()
			gameController.restoreState = data
			print (data)
			gameController.Load()
			file.close()

""" func SaveGame():

	var saveGame = File.new()
	saveGame.open("user://savegame.save", File.WRITE)
	var persist = get_tree().get_nodes_in_group("Persist")
	for node in persist:
		var nodeData = gameController.Save()
		saveGame.store_line(to_json(nodeData))
	saveGame.close()

func LoadGame():
	
	var saveGame = File.new()
	if not saveGame.file_exists("user://savegame.save"):
		return
	
	# var persist = get_tree().get_nodes_in_group("Persist")
	# for node in persist:
	# 	node.queue_free()
	saveGame.open("user://savegame.save", File.READ)
	while not saveGame.eof_reached():
		var current_line = parse_json(saveGame.get_line())
		if current_line != null:
			# var newNode = load(current_line["filename"]).instance()
			# get_node(current_line["parent"]).add_child(newNode, true)
			# newNode.position = Vector2(current_line["position_x"], current_line["position_y"])
			for property in current_line.keys():
				if (property == "diamondkey"
				|| property == "bridge"
				|| property == "lantern"):
					continue
					# newNode.set(property, current_line[property])
	saveGame.close()
 """
