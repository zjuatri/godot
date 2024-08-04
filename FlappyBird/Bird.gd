extends CharacterBody2D

const WIDTH = 960
const HEIGHT = 720
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	position = Vector2(WIDTH/2, HEIGHT/2)

	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY


	move_and_slide()


func _on_area_2d_area_entered(area:Area2D):
	get_tree().reload_current_scene()



func _on_visible_on_screen_notifier_2d_screen_exited():
	get_tree().reload_current_scene()
