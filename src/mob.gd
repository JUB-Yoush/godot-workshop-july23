extends Area2D

var angle:= Vector2.ZERO
var speed :float

signal died

func _ready() -> void:
	area_entered.connect(touching_hitbox)
	body_entered.connect(touching_body)
	$VisibleOnScreenNotifier2D.screen_exited.connect(func(): queue_free())

func _process(delta: float) -> void:
	rotation = angle.angle()
	position += speed * angle * delta

func touching_hitbox(area:Area2D):
	if area.is_in_group("proj"):
		area.queue_free()
		died.emit()
		queue_free()

func touching_body(area:PhysicsBody2D):
	if area.is_in_group("player"):
		get_tree().reload_current_scene()
