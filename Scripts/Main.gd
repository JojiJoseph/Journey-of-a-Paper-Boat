extends Spatial



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Coin = preload("res://Scenes/Coin.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Spatial.global_transform.origin -= delta*Vector3(5,0,0) # 5 m/s
	var last_x = -1000
	for child in $Coins.get_children():
		child.global_transform.origin -= delta * Vector3(5, 0, 0)
		last_x = max(last_x, child.global_transform.origin.x)
	if last_x < 0:
		var new_coin = Coin.instance()
		new_coin.global_transform.origin = Vector3(rand_range(0,1), rand_range(0, 1), 0.5)
		$Coins.add_child(new_coin)
