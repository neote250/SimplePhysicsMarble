extends RigidBody2D

var bounce_factor = 0.4
var rolling_friction = 0.985
var marble_radius = 16.0  # Should match your collision shape

func _ready():
	# Set up physics properties for better feel
	gravity_scale = 0  # We handle gravity manually
	linear_damp = 0.5  # Reduced air resistance for more responsive feel
	angular_damp = 0.05  # Less angular damping for better rolling
	
	# Set up physics material for realistic bouncing
	var physics_material = PhysicsMaterial.new()
	physics_material.bounce = bounce_factor
	physics_material.friction = 1.2  # Higher friction for better control
	set_physics_material_override(physics_material)

func _integrate_forces(state):
	# Apply rolling friction more realistically
	if state.linear_velocity.length() > 10.0:  # Only apply when moving
		state.linear_velocity *= rolling_friction
	else:
		# Stronger braking when moving slowly
		state.linear_velocity *= 0.95
	
	# Limit maximum speed but allow for quick acceleration
	var max_speed = 400.0
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
	
	# Sync visual rotation with rolling (makes it feel more connected)
	if state.linear_velocity.length() > 5.0:
		var rolling_speed = state.linear_velocity.length() / marble_radius
		state.angular_velocity = rolling_speed * sign(state.linear_velocity.x)
