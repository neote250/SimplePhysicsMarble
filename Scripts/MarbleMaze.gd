# MarbleMaze.gd - Main game script
# Attach this to the main scene (Node2D)

extends Node2D

@onready var marble = $MazeContainer/Marble
@onready var goal = $MazeContainer/Goal
@onready var ui = $UI
@onready var timeLabel = $UI/Panel/Label

var tilt_strength = 1200.0  #decrease for more physics-y
var tilt_speed = 120.0
var current_tilt = Vector2.ZERO
var level_complete = false
var trackedTime = 0
var fullNumberTracker = 0

func _ready():
	# Connect goal signal
	goal.body_entered.connect(_on_goal_reached)
	
	$UI/Panel2/Label.text = "Best: {0}".format([ScoreManager.highScore])
	
	# Center the maze rotation around screen center
	var viewport_size = get_viewport().get_visible_rect().size
	$MazeContainer.position = viewport_size / 2

func _process(delta):
	if level_complete:
		_restart_level()
		return
	if(fullNumberTracker < 1):
		fullNumberTracker += get_process_delta_time()
	else:
		fullNumberTracker -= 1
		trackedTime+=1
		
	timeLabel.text = "Time: {0}".format([trackedTime])
	# Handle input for tilting the maze with slight smoothing
	var input_vector = Vector2.ZERO
	var input_strength = 1.0
	
	# Get input with variable strength
	if Input.is_action_pressed("move_left"):
		input_vector.x -= input_strength
	if Input.is_action_pressed("move_right"):
		input_vector.x += input_strength

	
	# Apply tilt with slight acceleration feel
	var tilt_acceleration = tilt_speed
	if input_vector.length() > 0:
		current_tilt += input_vector * tilt_acceleration * delta
	
	# Rotate the entire maze around its center (except UI)
	$MazeContainer.rotation_degrees = current_tilt.x
	
	# Apply gravity directly
	var gravity_force = Vector2(0, tilt_strength)
	marble.apply_central_force(gravity_force)

func _on_goal_reached(body):
	if body == marble:
		level_complete = true
		if(trackedTime < ScoreManager.highScore):
			ScoreManager.highScore = trackedTime


func _restart_level():
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")


func _on_hole_body_entered(body: Node2D) -> void:	
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")

func _on_hole_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")

func _on_hole_3_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")

func _on_hole_4_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")

func _on_hole_5_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")

func _on_hole_6_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/MarbleMaze.tscn")
