extends Node2D

onready var spokeOneAnim = $SpokeOne
onready var spokeTwoAnim = $SpokeTwo
onready var spokeThreeAnim = $SpokeThree
onready var spokeFourAnim = $SpokeFour
onready var spokeFiveAnim = $SpokeFive
onready var centerAnim = $center

var canAddKey = false

# signal openChurch

""" Key names will be SpokeOne, SpokeTwo, SpokeThree, SpokeFour, SpokeFive, and CenterKey
Spoke keys have to be named in the level in order to avoid having to make 5 separate prefabs """

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