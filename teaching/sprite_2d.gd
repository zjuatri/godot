extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = get_node("../Button")
	button.pressed.connect(button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_pressed():
	position.x += 1