# draws the collision shape as a colored shape
# onto the parent object
extends CollisionShape2D

@export var color: Color


func _ready() -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	shape.draw(get_parent().get_canvas_item(), color)
