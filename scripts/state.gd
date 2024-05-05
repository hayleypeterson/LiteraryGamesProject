extends Node

#for handling May's position between scenes
var last_scene = "res://scene1.tscn"
var current_scene = "res://scene1.tscn"
var state_history = []
var awakening: bool = true

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
var computer_locked: bool = true
var already_unlocked: int = 0
var know_password: bool = false
var looking_for_password: bool = false
var saw_desk: bool = false

var game_ended: bool = false
