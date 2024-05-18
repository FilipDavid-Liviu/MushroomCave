extends StaticBody2D
@onready var collision_polygon_2d = $CollisionPolygon2D

func _process(_delta):
	scale = Vector2(-1, 1)
	if Input.is_action_just_pressed("down"):
		collision_polygon_2d.disabled = true
	if Input.is_action_just_released("down"):
		collision_polygon_2d.disabled = false
