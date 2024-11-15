extends KinematicBody2D

export var accel = 512
export var maxSpeed = 90
export var friction = 0.25
export var gravity = 400 #changed on node
export var jForce = 128 #this variable was jumpForce but did not work...changed to jForce
export var maxSlope = 46
export var canDie = false
export var timeLeft = 10

#controls light scaling
export (float) var lightSpeed = .01
export var lanternScale = Vector2(2,2)
export var lightCanScale = true

var canDuck = true
var canJump = true
var motion = Vector2.ZERO
var snap = Vector2.ZERO
var justJumped = false
var canMove = true
var setToggle = false
var energy = 3 #needed?
var movingRight = true
var movingLeft = false
var startTime = false
var onLadder = false
var goingDown = false

onready var sprite = $Sprite
onready var animation = $AnimationPlayer
onready var timer = $Timer
onready var lanternLight = $Sprite/Light2D
onready var gameController = get_node("/root/GameController")
onready var characterSpawner = get_node("/root/CharacterSpawner") #only here to reset character
onready var cameraFollow = $CameraFollow

func _ready():
	gameController.RegisterPlayer(self) #allows access to player from other scripts
#	$"/root/GameController".RegisterPlayer(self)
	timer.set_wait_time(timeLeft)
	
	print (gameController.player.canDie)
	# this section of code is apparently not working. Seems to have to do with the load order of the character,
	# level and game controllers
	if canDie == true:
		timer.start()
		print("wtf")
	# cameraFollow.remote_path = gameController.WorldCamera.get_path()

func _process(_delta):
	
	Cheats()
	# print (timer.time_left)	
	if gameController.hasLantern == true:
		lanternLight.show()
		#timer.stop()
	
	if Input.is_action_just_pressed("lantern") && gameController.hasLantern == true:
		gameController.hasLantern = false
		lanternLight.hide()
		timer.start()
		setToggle = true
		
	elif Input.is_action_just_pressed("lantern") && setToggle == true:
		gameController.hasLantern = true
		lanternLight.show()
		timer.stop()
		
func _physics_process(delta):

	if gameController.start != true:
		justJumped = false
		var pos = GetPosition()
	#	if Input.is_action_just_pressed("ui_cancel"):
	#		get_tree().quit()
		GetMovement(delta, pos)
		Friction(pos)
		Gravity(delta)
		UpdateSnap()
		Ladder(delta)
		Jump()
		#UpdateAnim(pos)
	#	UpdateAnimL(pos)
		Move(pos)
		Duck()
		LanternScale(delta)

func GetPosition():
	var pos = Vector2.ZERO
	pos.x = Input.get_action_strength("Left Analog - Right") - Input.get_action_strength("Left Analog - Left")
	return pos

func GetMovement(delta, pos):
	if pos.x != 0:
		motion.x += pos.x * accel * delta
		motion.x = clamp(motion.x, -maxSpeed, maxSpeed)

func Duck():
	if canDuck && is_on_floor():
		if Input.is_action_pressed("Left Analog - Down") && gameController.hasLantern == true:
			animation.play("duckL")
			canMove = false	
		elif Input.get_action_strength("Left Analog - Down") && gameController.hasLantern == false: 
			animation.play("duck")
			canMove = false
		else:
			canMove = true

func Friction(pos):
	if pos.x == 0:
		motion.x = lerp(motion.x, 0, friction)

func UpdateSnap():
	if is_on_floor():
		snap = Vector2.DOWN


func Ladder(delta):

	if onLadder == true:
		# gravity = 0
		if Input.is_action_pressed("Left Analog - Up"):
			position.y += -300.0 * delta
			# animation.play("ladder")
			# snap = Vector2.ZERO
			# justJumped = true
		elif Input.is_action_pressed("Left Analog - Down"):
			goingDown = true
			position.y += 75 * delta
			# animation.play("ladder")
		else:
			goingDown = false

func Jump():
	if canJump == true:
		if is_on_floor() && !onLadder:
			if Input.is_action_just_pressed("Jump"):
				motion.y = -jForce
				justJumped = true
				snap = Vector2.ZERO
		else:
			if Input.is_action_just_released("Jump") && motion.y < - jForce/2:
				motion.y = -jForce/2;

func Gravity(delta):
	if not is_on_floor():
		motion.y += gravity * delta
		motion.y = min(motion.y, jForce)
		
func UpdateAnim(pos):
	if pos.x != 0 && gameController.hasLantern == false:
		sprite.scale.x = sign(pos.x)
		animation.play("walk")
	else:
		animation.play("idle")

	if not is_on_floor():
		animation.play("jump")

	if !is_on_floor() && onLadder:
		animation.play("ladder")

func UpdateAnimL(pos):
	if pos.x != 0 && gameController.hasLantern == true:
		sprite.scale.x = sign(pos.x)
		animation.play("walkL")
	else:
		animation.play("idleL")

	if not is_on_floor():
		animation.play("jumpL")

func Move(pos):
	if canMove == true:
		var wasInAir = not is_on_floor()
		var wasOnFloor = is_on_floor()
		var lastPosition = position
		var lastMotion = motion
		
		motion = move_and_slide_with_snap(motion, snap*4, Vector2.UP, true, 4, deg2rad(maxSlope))
		
		if wasInAir && is_on_floor():
			motion.x = lastMotion.x
		
		if wasOnFloor && not is_on_floor() && not justJumped:
			motion.y = 0

			# motion.y = lastPosition.y
			
		if is_on_floor() && get_floor_velocity().length() == 0 and abs(motion.x) < 1:
			position.x = lastPosition.x
			
	if gameController.hasLantern == false:
		UpdateAnim(pos)
	else:
		UpdateAnimL(pos)

func _on_Timer_timeout():
	KillPlayer()
	
func MoveTo(targetPOS):
	position = targetPOS

func _on_Light_area_entered(_area):
	#print("in light")
	timer.stop()

func _on_Light_area_exited(_area):
	#if needLight == false:
#		timer.stop()
	#else:
	#print("no light")
	if canDie == true:
		timer.start()
	
func LanternScale(delta):
	if lightCanScale == true && gameController.hasLantern == true:
		lanternScale = lanternScale - Vector2(lightSpeed, lightSpeed) * delta
		lanternLight.set_scale (lanternScale)

		#i don't think i need the energy to decay as the scale of the graphic for it will do it for me
		# energy = lanternLight.energy - lightSpeed * delta
		# lanternLight.set_energy (energy)

		if lanternScale < Vector2(0,0):
			lightCanScale = false
			timer.start()
			print("no light")
			
		else:
			lightCanScale = true
			timer.stop()
			# print("in the light")
	
	if lanternScale < Vector2(0.75,0.75):
		VisualServer.set_default_clear_color(Color.black)

func KillPlayer():
	print ("dead")

func Cheats():
	if Input.is_action_just_pressed("ui_page_up"):
		maxSpeed += 100
	
	if Input.is_action_just_pressed("ui_home"):
		maxSpeed = 130

	if Input.is_action_just_pressed("lanterncheat"):
		gameController.hasLantern = true

	if Input.is_action_just_pressed("key"):
		print ("take this key out")

	if Input.is_action_just_pressed("reset"):
		gameController.player.position = characterSpawner.destination

	if Input.is_action_just_pressed("save"):
		SaveLoad.SaveGame()
		# pass

	if Input.is_action_just_pressed("load"):
		print(gameController.returnLevel)
		# pass

	if Input.is_action_just_pressed("timer"):
		print(timer.start())

func Item():
	var oilAmount = Vector2.ZERO

	oilAmount = randf()*1

	# #print (oilAmount)
	
	if lanternScale < Vector2 (3, 3):
		lanternScale = lanternScale + Vector2(oilAmount, oilAmount)
		lanternLight.set_scale (lanternScale)
		#print (lanternScale)
		energy = lanternLight.energy + oilAmount
		lanternLight.set_energy (energy)
		# #print (energy)

func TimerControl():
	if startTime == true:
		timer.start()
	else:
		timer.stop()
