# MarbleMaze.gd - Main game script
# Attach this to the main scene (Node2D)

extends Node2D

@onready var marble = $MazeContainer/Marble
@onready var goal = $MazeContainer/Goal
@onready var ui = $UI

var tilt_strength = 1200.0  # Increased for more responsive feel
var tilt_speed = 120.0  # Slightly faster rotation
var current_tilt = Vector2.ZERO
var level_complete = false

func _ready():
	# Connect goal signal
	goal.body_entered.connect(_on_goal_reached)
	
	# Set up UI
	ui.get_node("RestartButton").pressed.connect(_restart_level)
	ui.get_node("Label").text = "Use WASD or Arrow Keys to tilt the maze!"
	
	# Center the maze rotation around screen center
	var viewport_size = get_viewport().get_visible_rect().size
	$MazeContainer.position = viewport_size / 2

func _process(delta):
	if level_complete:
		return
		
	# Handle input for tilting the maze with slight smoothing
	var input_vector = Vector2.ZERO
	var input_strength = 1.0
	
	# Get input with variable strength
	if Input.is_action_pressed("move_left"):
		input_vector.x -= input_strength
	if Input.is_action_pressed("move_right"):
		input_vector.x += input_strength
	if Input.is_action_pressed("move_up"):
		input_vector.y -= input_strength
	if Input.is_action_pressed("move_down"):
		input_vector.y += input_strength
	
	# Apply tilt with slight acceleration feel
	var tilt_acceleration = tilt_speed
	if input_vector.length() > 0:
		current_tilt += input_vector * tilt_acceleration * delta
	
	# Rotate the entire maze around its center (except UI)
	$MazeContainer.rotation_degrees = current_tilt.x
	
	# Apply gravity directly - no rotation needed since marble rotates with container
	var gravity_force = Vector2(0, tilt_strength)
	marble.apply_central_force(gravity_force)

func _on_goal_reached(body):
	if body == marble:
		level_complete = true
		ui.get_node("Label").text = "Level Complete! Press Restart to play again."
		print("Goal reached!")

func _restart_level():
	level_complete = false
	current_tilt = Vector2.ZERO
	$MazeContainer.rotation_degrees = 0
	marble.position = $MazeContainer/StartPosition.position
	marble.linear_velocity = Vector2.ZERO
	marble.angular_velocity = 0
	ui.get_node("Label").text = "Use WASD or Arrow Keys to tilt the maze!"
