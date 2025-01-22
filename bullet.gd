class_name Bullet
extends Node2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var speed: float



func _physics_process(delta: float) -> void:
	# store current position
	var previous_position: Vector2
	previous_position= position
	
	# move forward
	position+= transform.x * speed * delta
	
	# check if we hit something between our previous 
	# and current position
	ShapecastHelper.cast(previous_position, position, collision_shape_2d.shape)
	
	if ShapecastHelper.is_colliding():
		# and destroy if it collided
		queue_free()
