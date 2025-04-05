extends Node3D

var dieScene = load("res://die.tscn")
var iterationAmount = 0.1


func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		spawn_dice(4)

func spawn_dice(amount: int):
	var positionMultiplier = 0
	for n in amount:
		var instance = dieScene.instantiate()
		
		add_child(instance)
		instance.position.x = self.position.x + positionMultiplier
		instance.position.y = self.position.y + positionMultiplier
		instance.position.z = self.position.z + positionMultiplier
		
		var rng = RandomNumberGenerator.new()
		instance.set_rotation(Vector3(rng.randi_range(0, 360), rng.randi_range(0, 360), rng.randi_range(0, 360)))
		positionMultiplier += iterationAmount
