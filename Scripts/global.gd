extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var distance_travelled = 0
var river_speed = 5 # m/s


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset():
	score = 0
	river_speed = 5
	distance_travelled = 0
	
