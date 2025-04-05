extends RigidBody3D

@export var minRandomForce = 500
@export var maxRandomForce = 1000

@onready var faces = $Faces

var isMoving = false

func _physics_process(delta):
	isMoving = linear_velocity.length() > 0.01
	
	if Input.is_action_pressed("ui_select"):
		shove_dice()
		print(get_number())
	
func get_number():
	var lowest_y
	var number
	
	for node in faces.get_children():
		var y_value = node.global_position.y
		
		if not lowest_y || y_value < lowest_y:
			lowest_y = y_value
			number = node.name
			
	return int(str(number))

func shove_dice():
	if isMoving: return
	
	var rng = RandomNumberGenerator.new()
	var randomDirection = [-1, 1]
	var force = Vector3.ZERO
	
	force.x = rng.randi_range(minRandomForce, maxRandomForce) * randomDirection.pick_random()
	force.z = rng.randi_range(minRandomForce, maxRandomForce) * randomDirection.pick_random()
	
	apply_torque(force)
