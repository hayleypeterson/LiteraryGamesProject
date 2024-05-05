extends ColorRect

signal fade_request
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Fade.fade_request(_on_fade_request)
	
func _on_fade_request():
	print("Fade signal received")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
