extends Light2D

func _process(_delta):
	Pulse()
	
func Pulse():
	
	var time = 3
	time -= 1
	# #print(time)
#	yield(get_tree().create_timer(10), "timeout")
	if time == 0:
		var rng = randi()%8
		self.energy = rng
		time = 3
