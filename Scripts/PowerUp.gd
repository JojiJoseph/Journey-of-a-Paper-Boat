extends Spatial

enum {
	EXTRA_POINTS,
	KILL_ALL,
	INVINCIBLE,
	
}

export(int) var power = EXTRA_POINTS

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
	pass
	
	
func _process(_delta):
	pass
	#if Engine.editor_hint:
	#	$Sprite.texture = powerup_sprites[power]
	#if not Engine.editor_hint:
	#	if Global.player:
	#		if (Global.player.global_position - global_position).length() > 10_000:
	#			queue_free()
