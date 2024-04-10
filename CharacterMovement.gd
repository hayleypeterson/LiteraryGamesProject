extends CharacterBody2D
@export var movement_speed : float = 50
@export var force_coefficient = 20
@onready var _animated_sprite = $AnimatedSprite2D
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

func _process(_delta):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction.y > 0: #walking "downward"
		_animated_sprite.play("walk_down")
	elif input_direction.y < 0:
		_animated_sprite.play("walk_up")
		# Flip the sprite based on the input direction
	elif input_direction.x != 0:
		if input_direction.x > 0:
			_animated_sprite.play("walk_right")  # Facing right
		else:
			_animated_sprite.play("walk_left")  # Facing left
	else:
		_animated_sprite.stop()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input(delta):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * movement_speed

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
			#DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "start")
			var actionables = actionable_finder.get_overlapping_areas()
			if actionables.size() > 0:
				actionables[0].action()
				return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input(delta)

	var pre_collision_velocity
	pre_collision_velocity = velocity # velocity goes to 0,0 when we collide, which is why we record the velocity prior to the move_and_slide() func call
	move_and_slide()

	for i in get_slide_collision_count():
		var collision : KinematicCollision2D = get_slide_collision(i)

		if collision.get_collider().get_class() == "RigidBody2D":
			var collision_normal = collision.get_normal()
			if collision_normal.x < 0 and pre_collision_velocity.x > 0:
				collision_normal.x = -collision_normal.x
			if collision_normal.y < 0 and pre_collision_velocity.y > 0:
				collision_normal.y = -collision_normal.y
			collision.get_collider().apply_force(pre_collision_velocity * collision_normal * force_coefficient)

		

