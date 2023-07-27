extends Node2D

# get a reference to the timer
# make a function that runs when it times out
# that function will be the rat spawn function

@onready var mobSpawnTimer:Timer = $MobSpawnTimer
var spawn_time := 0.5
var mobScene = load("res://src/mob.tscn")
var score:= 0


func _ready() -> void:
	mobSpawnTimer.timeout.connect(spawn_mob)
	mobSpawnTimer.wait_time = spawn_time
	mobSpawnTimer.start()
	pass
	
func spawn_mob() -> void:
	var mob = mobScene.instantiate()
	var mobSpawnLocation := $MobSpawnPath/MobLocation
	mobSpawnLocation.progress_ratio = randf()
	mob.position = mobSpawnLocation.position
	var direction = mobSpawnLocation.rotation + PI /2
	direction += randf_range(-PI/4,PI/4)
	mob.angle = Vector2.RIGHT.rotated(direction)
	mob.speed = randf_range(100,200)
	mob.died.connect(update_score)
	add_child(mob)

func update_score():
	score += 1
	var scoreLabel = $Label
	scoreLabel.text = "SCORE: " + str(score)

