extends KinematicBody2D

export (PackedScene) var enemy
export (PackedScene) var player

var fighting = false

func _ready():
	spawn_enemy()
	
	var new_player = player.instance()
	new_player.position = Vector2(0,-70)
	add_child(new_player)
	
	get_node("Player").connect("fight", self, "set_behaviour" )
	get_node("Player").connect("peace", self, "set_peace" )
	
func _physics_process(delta):
	move_and_slide(Vector2(-1000, 0))
	
	if fighting:
		$Camera2D.set_offset(Vector2(rand_range(-200.0, -203.0),rand_range(-1.0, 1.0) * 3.0))
	
func spawn_enemy():
		var new_enemy = enemy.instance()
		new_enemy.position = Vector2(-380,-70)
		add_child(new_enemy)

func _on_Timer_timeout():
	spawn_enemy()
	$Timer.set_wait_time(rand_range(0.5, 1.7))

func set_behaviour():
	fighting = true
	
func set_peace():
	$KillSound.play()
	fighting = false