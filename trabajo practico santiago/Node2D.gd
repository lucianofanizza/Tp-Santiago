extends KinematicBody2D

var vector_normal = Vector2(0,-1)
var velocity = Vector2()

func get_input():
    
    if Input.is_action_pressed("ui_right"):
        velocity.x = 400
    if Input.is_action_pressed("ui_left"):
        velocity.x = -400
    if Input.is_action_just_released("ui_right"):
        velocity.x = 0
    if Input.is_action_just_released("ui_left"):
        velocity.x = 0

func _physics_process(delta):
	get_input()
	velocity.y += 80
	if is_on_floor():
		velocity.y = 1
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y -= 900
	move_and_slide(velocity, vector_normal)
	