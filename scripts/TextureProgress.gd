extends TextureProgress


func _process(delta):
	self.value = 100 - $Timer.time_left
	#print(self.value)
	if self.value > 98:
		get_tree().change_scene('res://scenes/startgame.tscn')