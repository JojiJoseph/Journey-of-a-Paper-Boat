extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		translate(Vector3(0,0,-0.01))
	if Input.is_action_pressed("right"):
		translate(Vector3(0,0,+0.01))


func _on_Area_body_entered(body):
	print(Global.score)
	body.queue_free()
	Global.score += 1