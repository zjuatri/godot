extends Node2D

const WIDTH = 960
const HEIGHT = 720
const velocity = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = WIDTH + 100
	position.y = randf_range(200,500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x +=  -velocity * delta