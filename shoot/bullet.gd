extends CharacterBody2D

func _ready() -> void:
	velocity = Vector2(1000,0)

func _physics_process(delta: float) -> void:
	move_and_slide()