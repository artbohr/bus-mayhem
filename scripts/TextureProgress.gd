extends TextureProgress


func _process(delta):
	self.value = 100 - ($Timer.time_left * 2 )
	#print(self.value)
	if self.value > 99.9:
		get_tree().change_scene('res://scenes/gamefinish.tscn')