extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(load("res://arrow.svg"),Input.CURSOR_ARROW)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	Global.reset()
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_HelpButton_pressed():
	get_tree().change_scene("res://Scenes/Help.tscn")


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Scenes/Settings.tscn")
