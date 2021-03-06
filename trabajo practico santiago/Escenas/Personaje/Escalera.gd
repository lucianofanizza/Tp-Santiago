extends KinematicBody2D

export (int) var speed = 100
export var gravedad = 600
export var vel_salto = 500

var velocity = Vector2()



func get_input():
    velocity = Vector2()
    if Input.is_action_pressed("bajar"):
        velocity.y += 100
    if Input.is_action_pressed("subir"):
        velocity.y -= 100
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity)