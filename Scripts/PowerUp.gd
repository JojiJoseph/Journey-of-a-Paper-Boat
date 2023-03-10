extends Spatial

enum {
	SPEED_UP,
	MAGNET,
	SLOW_DOWN
}

export(int) var power = SPEED_UP

#var powerup_sprites = [
#	preload("res://art/power_ups/power_up_double.svg"),
#	preload("res://art/power_ups/power_up_kill_all.svg"),
#	preload("res://art/power_ups/power_up_life.svg"),
#	preload("res://art/power_ups/power_up_missile.svg"),
#	preload("res://art/power_ups/power_up_armour.svg")
#]


func _ready():
	#if power >= len(powerup_sprites):
	#	print_debug("Invalid powerup index")
	#	queue_free()
	#	return
	#$Sprite.texture = powerup_sprites[power]
	$Magnet.hide()
	$Rabbit.hide()
	$Turtle.hide()
	
	
	
func _process(_delta):
	#for child in $Meshes.get_children():
	#	child.hide()
	if power == MAGNET:
		$Magnet.show()
		$AnimationPlayer.play("rotate_magnet")
	if power == SPEED_UP:
		$Rabbit.show()
		$AnimationPlayer.play("rotate_rabbit")
	if power == SLOW_DOWN:
		$Turtle.show()
		$AnimationPlayer.play("rotate_turtle")
	#if Engine.editor_hint:
	#	$Sprite.texture = powerup_sprites[power]
	#if not Engine.editor_hint:
	#	if Global.player:
	#		if (Global.player.global_position - global_position).length() > 10_000:
	#			queue_free()
