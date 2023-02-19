extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var in_title = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not in_title:
		if Input.is_action_pressed("left"):
			if global_transform.origin.z-0.2 >= -10:
				translate(Vector3(0,0,-0.2))
		if Input.is_action_pressed("right"):
			if global_transform.origin.z+0.2 <= 10:
				translate(Vector3(0,0,+0.2))
		var camera = get_parent().get_node("Camera")
	
		camera.global_transform.origin.z = 20
		camera.global_transform.origin.y = 4 +  global_transform.origin.z/20
		camera.look_at(global_transform.origin, Vector3(0,1.0,0))
		


func _on_Area_body_entered(body):
	#print(body)
	body.queue_free()
	Global.score += 1
	if not $Sounds/Coin.playing:
		$Sounds/Coin.play()


func _on_EnemyHitbox_body_entered(body):
	$Sounds/GameOver.pause_mode = Node.PAUSE_MODE_PROCESS
	$Sounds/GameOver.play()
	Global.game_over = true


func _on_PowerUpHitbox_body_entered(body):
	if body.power == body.SPEED_UP:
		Global.boat_speed += 10
		body.queue_free()
	if body.power == body.MAGNET:
		Global.magnet_mode = true
		Global.magnet_mode_elapsed = 0
		body.queue_free()
	if body.power == body.SLOW_DOWN:
		Global.boat_speed -= 20
		Global.boat_speed = max(2, Global.boat_speed)
		body.queue_free() 
	if not $Sounds/PowerUp.playing:
		$Sounds/PowerUp.play()
	
