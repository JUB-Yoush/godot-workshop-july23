extends Area2D

var speed:=300.0
var angle:=Vector2.ZERO

func _ready() -> void:
	$VisibleOnScreenNotifier2D.screen_exited.connect(func(): queue_free())


func _process(delta: float) -> void:
	rotation = angle.angle()
	position += speed * angle * delta


