extends Node

var player
# var WorldCamera = null

var start = true
var drawBridgeOpen = false
var gateOpen = false
var hasLantern = false
var exitSave = Vector2(0,0)
var inSaveRoom = false
var returnLevel = ""

#dictionaries
var keys := {}
var levelState := {}
var restoreState = {}

func _ready():

	add_to_group("Persist")

	""" if SaveLoad.isLoading == true:
		SaveLoad.LoadGame()
		SaveLoad.isLoading = false """

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func GotLantern():
	hasLantern = true

func RegisterPlayer(in_player):
	player = in_player

""" Save function pulls from the current variables and stores in a dictionary
that is written to the file specified in SaveLoad.gd """
func Save():
	var gameState = {
		# "diamondkey" : diamondKey, #this needs to be changes to the keys dictionary.
		"Keys" : keys,
		# "bridge" : drawBridgeOpen,
		"levelstate" : levelState,
		"lantern" : hasLantern,
		"exitsave" : exitSave,
		"insaveroom" : inSaveRoom,
		"returnlevel" : returnLevel
	}
	return gameState

# Load function restores the data from the file and sets the variables
func Load():

	# diamondKey = restoreState["diamondkey"]
	keys = restoreState["Keys"]
	hasLantern = restoreState["lantern"]
	# drawBridgeOpen = restoreState["bridge"]
	levelState = restoreState["levelstate"]
	exitSave = restoreState["exitsave"]
	inSaveRoom = restoreState["insaveroom"]
	returnLevel = restoreState["returnlevel"]
