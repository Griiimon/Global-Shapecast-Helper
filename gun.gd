extends Node2D

@export var bullet_scene: PackedScene

@onready var muzzle: Node2D = $Muzzle



func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("mouse_left"):
		shoot(100)
	elif Input.is_action_just_pressed("mouse_right"):
		shoot(1000)


func shoot(speed: float):
	var bullet: Bullet= bullet_scene.instantiate()
	bullet.position= muzzle.global_position
	bullet.rotation= muzzle.global_rotation
	bullet.speed= speed
	get_tree().current_scene.add_child(bullet)
