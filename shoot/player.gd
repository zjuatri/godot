extends Sprite2D

signal shoot(bullet, direction, location)

var Bullet = preload("res://bullet.tscn")
# func _input(event):
# 	if event is InputEventMouseButton:
# 		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
# 			shoot.emit(Bullet, rotation, position)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot.emit(Bullet, self.rotation, self.position)
	look_at(get_global_mouse_position())