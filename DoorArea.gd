extends Area2D
@export var scenechange: String = ""
var entered = false


func _on_body_entered(body: CharacterBody2D):
	entered = true



func _on_body_exited(body: CharacterBody2D):
	entered = false
	
	
func _process(delta):
	if (entered):
		if Input.is_action_just_pressed("ui_accept"):
			State.last_scene = State.current_scene
			State.current_scene = scenechange
			get_tree().change_scene_to_file(scenechange)
