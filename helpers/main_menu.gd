extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_music_level()
	pass # Replace with function body.


func _on_button_pressed(): # play button
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scene1.tscn")


func _on_button_2_pressed(): # quit button
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().quit()
