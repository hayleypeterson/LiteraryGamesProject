extends Area2D
@export var scenechange: String = ""
var entered = false
var changing = false

func _on_body_entered(_body: CharacterBody2D):
	entered = true

func _on_body_exited(_body: CharacterBody2D):
	entered = false
	
	
func _process(_delta):
	if (entered):
		if Input.is_action_just_pressed("ui_accept") && changing == false:
			changing = true
			State.last_scene = State.current_scene
			State.current_scene = scenechange
			TransitionScreen.transition()
			await TransitionScreen.on_transition_finished
			get_tree().change_scene_to_file(scenechange)
