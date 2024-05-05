extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed(): # play button
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scene1.tscn")


func _on_button_2_pressed(): # quit button
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().quit()
