extends CharacterBody2D

const SPEED = 300
const FLAPVEL = 500

var open = 1;

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing = Vector2(0,-1)

@onready var sprite = $Sprite2D


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_accept"):
		open=0
	else:
		open = 1
	
	if not is_on_floor():
		velocity.y += (gravity * delta)/((open*3)+1)

	if open == 1:
		sprite.rotation = facing.angle()
		sprite.rotation_degrees +=90
		sprite.scale=Vector2(1,1)
	else:
		sprite.rotation = velocity.angle()
		sprite.rotation_degrees +=90
		sprite.scale=Vector2(0.3,1)
		
	facing=Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down")) 
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity = facing*FLAPVEL
	
	move_and_slide()
