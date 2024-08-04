extends Node2D

const WIDTH = 960
const HEIGHT = 720
var obstacle = preload("res://obstacles.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var obstacle_instance = obstacle.instantiate()
	add_child(obstacle_instance)