class_name Bullet
extends Node2D

const BOUNCE= true

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var velocity: Vector2



func _physics_process(delta: float) -> void:
	# calculating the next position of the projectile
	var next_position: Vector2= position + velocity * delta
	
	# check if we will hit something our current and next position
	ShapecastHelper.cast(position, next_position, collision_shape_2d.shape)
	
	if ShapecastHelper.is_colliding():
		if BOUNCE:
			# bounce if it collided
			# take the first collision normal we can get
			velocity= velocity.bounce(ShapecastHelper.get_collision_normal(0))
		else:
			# destroy if it collided
			queue_free()
	else:
		# if there wasn't any collision we can move the bullet
		# to the next position we previously calculated
		position= next_position
