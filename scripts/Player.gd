extends KinematicBody2D

const MOVE_SPEED = 200
var fighting = false
var move
signal fight
signal peace
signal shoot

func _ready():
	get_node('TextureProgress').connect("result", self, "check_hit")

func _physics_process(delta):	
	if Input.is_action_pressed('ui_right') and not fighting:
		move = MOVE_SPEED
	elif Input.is_action_pressed('ui_left') and not fighting:
		move = -MOVE_SPEED
	else:
		move = 0
	
	if Input.is_action_just_pressed('ui_battle'):
		emit_signal('shoot')
	
	move_and_slide(Vector2(move, 0))

func battle():
	move_and_slide(Vector2(250, 0))
	emit_signal('peace')

func _on_PlayerArea_area_shape_exited(area_id, area, area_shape, self_shape):
	if area.name != 'BusBack':
		area.get_parent().queue_free()
		fighting = false
		

func _on_PlayerArea_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.name != 'BusBack':
		fighting = true
		emit_signal('fight')
		
	elif area.name == 'BusBack':
		get_tree().change_scene('res://scenes/gameover.tscn')
		
func check_hit(ar):
	if ar:
		battle()