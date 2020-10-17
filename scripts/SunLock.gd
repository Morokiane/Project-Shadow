extends Node2D

onready var gameController = get_node("/root/GameController")

onready var spokeOneAnim = $SpokeOne
onready var spokeTwoAnim = $SpokeTwo
onready var spokeThreeAnim = $SpokeThree
onready var spokeFourAnim = $SpokeFour
onready var spokeFiveAnim = $SpokeFive
onready var centerAnim = $CenterKey

var canAddKey = false
var spokeOne = false
var spokeTwo = false
var spokeThree = false
var spokeFour = false
var spokeFive = false
var centerKey = false

# signal openChurch

""" Key names will be SpokeOne, SpokeTwo, SpokeThree, SpokeFour, SpokeFive, and CenterKey
Spoke keys have to be named in the level in order to avoid having to make 5 separate prefabs """

func _ready():
	if gameController.sunLock.has(spokeOne) == true:
		spokeOneAnim.play("keyin")
		spokeOne = true
	
	if gameController.sunLock.has(spokeTwo) == true:
		spokeTwoAnim.play("keyin")
		spokeTwo = true

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		canAddKey = true
		print("can add a key")
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		canAddKey = false
		print("can't add a key")
		
func _process(_delta):
	if Input.is_action_just_pressed("interact") && canAddKey:
		AddKey()

func AddKey():

	if GameController.keys.has("SpokeOne") == true:
		spokeOneAnim.play("keyin")
	if GameController.keys.has("SpokeTwo") == true:
		spokeTwoAnim.play("keyin")
	if GameController.keys.has("SpokeThree") == true:
		spokeThreeAnim.play("keyin")
	if GameController.keys.has("SpokeFour") == true:
		spokeFourAnim.play("keyin")
	if GameController.keys.has("SpokeFive") == true:
		spokeFiveAnim.play("keyin")
	if GameController.keys.has("CenterKey") == true:
		centerAnim.play("keyin")


#There is an issue with the below code not allowing for more than one key to be placed
#seems to have something to do with checked the game controller for the sunLock
""" func AddKey():

	if gameController.keys.has("SpokeOne") == true && gameController.sunLock.has(spokeOne) == false:
		spokeOneAnim.play("keyin")
		gameController.sunLock[spokeOne] = true
		
	if gameController.keys.has("SpokeTwo") == true && gameController.sunLock.has(spokeTwo) == false:
		print("should be adding key two")
		spokeTwoAnim.play("keyin")
		gameController.sunLock[spokeTwo] = true
	
	if gameController.keys.has("SpokeThree") == true && gameController.sunLock.has(spokeThree) == false:
		spokeThreeAnim.play("keyin")
		gameController.sunLock[spokeThree] = true

	if gameController.keys.has("SpokeFour") == true && gameController.sunLock.has(spokeFour) == false:
		spokeThreeAnim.play("keyin")
		gameController.sunLock[spokeFour] = true

	if gameController.keys.has("SpokeFive") == true && gameController.sunLock.has(spokeFive) == false:
		spokeThreeAnim.play("keyin")
		gameController.sunLock[spokeFive] = true

	if gameController.keys.has("CenterKey") == true && gameController.sunLock.has(centerKey) == false:
		centerAnim.play("keyin")
		gameController.sunLock[centerKey] = true
 """
