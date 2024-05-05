extends Node

#for handling May's position between scenes
var last_scene = "res://scene1.tscn"
var current_scene = "res://scene1.tscn"
var state_history = []

var snooped: bool = false
var saw_bed: String = ""
var saw_mays_desk: bool = false
var frozen: bool = false
var saw_diary: String = ""
var saw_paper: String = ""
var stairs: String = ""
var bathroom: int = 0
var study_locked: bool = true
var key_location: bool = false
var key: bool = false
