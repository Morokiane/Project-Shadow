extends Node

var player
var WorldCamera = null

var start = true
var diamondKey = false
var squareKey = false
var drawBridgeOpen = false
var hasLantern = false
# var destination = Vector2()
var exitSave = Vector2(0,0)
var inSaveRoom = false
export (String, FILE, "*.tscn") var returnLevel = ""

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

func Save():
	var gameState = {
		"diamondkey" : diamondKey,
		"bridge" : drawBridgeOpen,
		"lantern" : hasLantern,
		"exitsave" : exitSave,
		"insaveroom" : inSaveRoom,
		"returnlevel" : returnLevel
	}
	return gameState

func Load():

	diamondKey = restoreState["diamondkey"]
	hasLantern = restoreState["lantern"]
	drawBridgeOpen = restoreState["bridge"]
	exitSave = restoreState["exitsave"]
	inSaveRoom = restoreState["insaveroom"]
	returnLevel = restoreState["returnlevel"]
