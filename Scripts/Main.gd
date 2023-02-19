extends Spatial



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Coin = preload("res://Scenes/Coin.tscn")
var WorldBlock = preload("res://Scenes/LevelBlock.tscn")
var Boat = preload("res://Scenes/OtherBoat.tscn")
var Log = preload("res://Scenes/Log.tscn")
var Croc = preload("res://Scenes/Croc.tscn")
var Fish = preload("res://Scenes/Fish.tscn")
var PowerUp = preload("res://Scenes/PowerUp.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.game_over:
		$HUD/PauseScreen.show()
		get_tree().paused = true
	else:
		var world_blocks = $MovingBlocks.get_children()
		for world_block in world_blocks:
			world_block.global_transform.origin -= delta*Vector3(Global.boat_speed,0,0)
			Global.boat_speed += delta * 0.4
			Global.boat_speed = min(250, Global.boat_speed)
			
		if world_blocks[len(world_blocks)-1].global_transform.origin.x < 400:
			
			var new_world_block = WorldBlock.instance()
			$MovingBlocks.add_child(new_world_block)
			new_world_block.global_transform.origin.x = world_blocks[len(world_blocks)-1].global_transform.origin.x + 400
			new_world_block.global_transform.origin.y = world_blocks[len(world_blocks)-1].global_transform.origin.y
			new_world_block.global_transform.origin.z = world_blocks[len(world_blocks)-1].global_transform.origin.z
			if len(world_blocks) > 4:
				world_blocks[0].queue_free()
		var last_x = -1000
		var first_x = 1000
		for child in $Coins.get_children():
			child.global_transform.origin -= delta * Vector3(5, 0, 0)
			if Global.magnet_mode:
				var diff = $Player.global_transform.origin - child.global_transform.origin
				if diff.length() < 20:
					child.global_transform.origin += 10 * delta * diff
			last_x = max(last_x, child.global_transform.origin.x)
			first_x = min(first_x, child.global_transform.origin.x)
		if last_x < 100:
			var new_coin = Coin.instance()
			$Coins.add_child(new_coin)
			new_coin.global_transform.origin = Vector3(last_x + rand_range(10,20), 0.5, rand_range(0, 10))
			if first_x < -100:
				$Coins.get_child(0).queue_free()
		var power_ups = $PowerUps.get_children()
		last_x = -1000
		first_x = 1000
		for child in power_ups:
			child.global_transform.origin -= delta * Vector3(3, 0, 0)
			#print(child.global_transform.origin.x)
			last_x = max(last_x, child.global_transform.origin.x)
			first_x = min(first_x, child.global_transform.origin.x)
		if last_x < 200:
			var new_power_up = PowerUp.instance()
			$PowerUps.add_child(new_power_up)
			
			new_power_up.global_transform.origin = Vector3(last_x + rand_range(50,100), 0.5, rand_range(-10, 10))
			new_power_up.power = randi()%3
			if first_x < -100:
				$PowerUps.get_child(0).queue_free()
		$HUD/ScoreLabel.text = "score: " + str(Global.score)
		
		# Update boats
		var boats = $Boats.get_children()
		if len(boats) == 0:
			var new_boat = Boat.instance()
			$Boats.add_child(new_boat)
			new_boat.global_transform.origin.x = 20
		else:
			if boats[0].global_transform.origin.x < -90:
				var new_boat = Boat.instance()
				$Boats.add_child(new_boat)
				new_boat.global_transform.origin.x = boats[len(boats)-1].global_transform.origin.x + rand_range(50,60)
				new_boat.global_transform.origin.z = rand_range(-10,10)
			if boats[0].global_transform.origin.x < -100:
				boats[0].queue_free()
		for boat in boats:
			boat.global_transform.origin -= delta * Vector3(rand_range(2,4), 0, 0)
			
		
		return
		
		var logs = $Logs.get_children()
		if len(logs) == 0:
			var new_log = Log.instance()
			$Logs.add_child(new_log)
			new_log.global_transform.origin.x = 20
		elif logs[0].global_transform.origin.x < - 20:
			var new_log = Log.instance()
			$Logs.add_child(new_log)
			new_log.global_transform.origin.x = 10
			logs[0].queue_free()
		for log_ in logs:
			log_.global_transform.origin -= delta * Vector3(2, 0, 0)
			
		var crocs = $Crocs.get_children()
		if len(crocs) == 0:
			var new_croc = Croc.instance()
			$Crocs.add_child(new_croc)
			new_croc.global_transform.origin.x = 50
		elif crocs[0].global_transform.origin.x < - 50:
			var new_croc = Croc.instance()
			$Crocs.add_child(new_croc)
			new_croc.global_transform.origin.x = 30
			crocs[0].queue_free()
		for croc in crocs:
			croc.global_transform.origin -= delta * Vector3(2, 0, 0)
			
		var fishes = $Fishes.get_children()
		if len(fishes) == 0:
			var new_fish = Fish.instance()
			$Fishes.add_child(new_fish)
			new_fish.global_transform.origin.x = 50
		elif fishes[0].global_transform.origin.x < - 50:
			var new_fish = Fish.instance()
			$Fishes.add_child(new_fish)
			new_fish.global_transform.origin.x = 30
			fishes[0].queue_free()
		for fish in fishes:
			fish.global_transform.origin -= delta * Vector3(rand_range(-10,10), 0, 0)
			
		


func _on_RestartButoon_pressed():
	pass # Replace with function body.
