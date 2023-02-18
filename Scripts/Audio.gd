extends Control


var updation_in_progress = true

func _ready():
	var music_volume_db = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	var music_volume = db2linear(music_volume_db) * 100
	$GridContainer/MusicVolumeSlider.value = music_volume
	$GridContainer/MusicVolume.text = str(int(music_volume))
	
	var sfx_volume_db = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	var sfx_volume = db2linear(sfx_volume_db) * 100
	$GridContainer/SFXVolumeSlider.value = sfx_volume
	$GridContainer/SFXVolume.text = str(int(sfx_volume))
	
	updation_in_progress = false
	
func _process(delta):
	if not visible:
		$BackgroundMusic.playing = false
		$SFXMusic.playing = false


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_HSlider_value_changed(value):
	var volume_db = linear2db(value/100)
	$GridContainer/MusicVolume.text = str(value)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), volume_db)


func _on_MusicVolumeSlider_value_changed(value):
	var volume_db = linear2db(value/100)
	$GridContainer/MusicVolume.text = str(value)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), volume_db)


func _on_SFXVolumeSlider_value_changed(value):
	var volume_db = linear2db(value/100)
	$GridContainer/SFXVolume.text = str(value)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), volume_db)
	if not $SFXMusic.playing and not updation_in_progress:
		$SFXMusic.play()


func _on_MusicVolumeSlider_focus_entered():
	if not updation_in_progress:
		$BackgroundMusic.playing = true


func _on_MusicVolumeSlider_focus_exited():
	if not updation_in_progress:
		$BackgroundMusic.playing = false


func _on_SFXVolumeSlider_focus_entered():
	pass # Replace with function body.


func _on_SFXVolumeSlider_focus_exited():
	pass # Replace with function body.
