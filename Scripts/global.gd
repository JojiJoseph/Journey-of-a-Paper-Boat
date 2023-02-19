extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var distance_travelled = 0
var river_speed = 5 # m/s
var boat_speed = 5 # m/s
var game_over = false
var magnet_mode = false
var magnet_mode_elapsed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if magnet_mode:
		magnet_mode_elapsed += delta
		if magnet_mode_elapsed > 10:
			magnet_mode = false
			magnet_mode_elapsed = 0

func reset():
	score = 0
	river_speed = 5
	distance_travelled = 0
	game_over = false
	boat_speed = 5
	magnet_mode = false
	magnet_mode_elapsed = 0
	
