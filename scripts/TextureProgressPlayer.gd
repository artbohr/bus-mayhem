extends TextureProgress

var tex_def = preload("res://art/textureDefault.png")
var tex0 = preload("res://art/texture.png")
var tex1 = preload("res://art/texture3.png")
var tex2 = preload("res://art/texture4.png")

var arr = [tex0,tex1,tex2]
var nums = [48,77,92]
var target = 100

signal result(ar)

func _ready():
	get_parent().connect("fight", self, "fighting" )
	get_parent().connect("peace", self, "peace" )
	get_parent().connect("shoot", self, "check_hit" )

func _process(delta):
	if not $Timer.is_stopped():
		self.value = 100 - ($Timer.time_left * 50)
	else:
		self.value = 0
	
func get_r_texture():
	randomize()
	var index = range(0,3)[randi()%range(0,3).size()]
	
	target = nums[index]
	self.texture_under = arr[index]
	
func fighting():
	get_r_texture()
	$Timer.start()
	
func peace():
	self.texture_under = tex_def
	$Timer.stop()

func check_hit():
	#print(str(self.value) + ' value')
	#print(str(target) + ' target')
	emit_signal('result', !self.value < target-10 and !self.value > target+10)