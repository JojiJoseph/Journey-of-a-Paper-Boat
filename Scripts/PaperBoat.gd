extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum {
	EXTRA_POINTS,
	KILL_ALL,
	INVINCIBLE,
	
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		if global_transform.origin.z-0.1 >= -10:
			translate(Vector3(0,0,-0.1))
	if Input.is_action_pressed("right"):
		if global_transform.origin.z+0.1 <= 10:
			translate(Vector3(0,0,+0.1))
	var camera = get_parent().get_node("Camera")
	camera.global_transform.origin.z = 20
	camera.global_transform.origin.y = 4 +  global_transform.origin.z/20
	camera.look_at(global_transform.origin, Vector3(0,1.0,0))
		


func _on_Area_body_entered(body):
	print(body)
	body.queue_free()
	Global.score += 1
	if not $Sounds/Coin.playing:
		$Sounds/Coin.play()


func _on_EnemyHitbox_body_entered(body):
	Global.game_over = true


func _on_PowerUpHitbox_body_entered(body):
	if body.power == body.EXTRA_POINTS:
		Global.score += 100
		body.queue_free()
	
