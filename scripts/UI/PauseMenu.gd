extends ColorRect

var paused = false setget SetPaused

func SetPaused(value):
	paused = value
	get_tree().paused = paused
	visible = paused
	
func _process(_delta):
	if Input.is_action_just_pressed("paused") || Input.is_action_just_pressed("ui_cancel"):
		self.paused = !paused

func _on_Resumebtn_pressed():
	# SoundFx.Play("click")
	self.paused = false

func _on_Quitbtn_pressed():
	get_tree().quit()
