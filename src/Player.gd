extends CharacterBody2D

# catch user input
# have that influence velocity 

var speed := 100.0
var move_dir := Vector2.ZERO
var aim_dir := Vector2.ZERO

var projScene:= load("res://src/proj.tscn")

func _physics_process(delta: float) -> void:
	move_dir = update_dir()
	aim_dir = update_aim_dir()
	velocity = speed * move_dir
	move_and_slide()
	
func update_aim_dir() -> Vector2:
	return (get_global_mouse_position() - position).normalized()

func update_dir() -> Vector2:
	return Input.get_vector("move_left","move_right","move_up","move_down")
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		make_proj()

func make_proj():
	var proj = projScene.instantiate()
	proj.angle = aim_dir
	proj.position = position
	get_parent().add_child(proj)
	pass
