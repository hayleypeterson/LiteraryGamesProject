
extends Node

signal fade_request

# Function to fade to black
func fade_to_black():
	print("Fade here.")
	#emit_signal("fade_request")
	fade_request.emit()
