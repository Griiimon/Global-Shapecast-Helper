# will be a Global ( autoloaded ) as ShapecastHelper
extends ShapeCast2D


func _ready() -> void:
	# a shapecast node will cast automatically each physics frame
	# but we want it only to be triggered manually 
	enabled= false


func cast(from: Vector2, to: Vector2, _shape: Shape2D):
	position= from
	
	# shapecast target position is relative to its origin
	# so we need to convert the global `to` position
	target_position= to_local(to)
	
	shape= _shape

	# force the shapecast run again with these new parameters
	force_shapecast_update()
