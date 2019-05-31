extends KinematicBody2D

export (int) var speed = 200
var vector_normal = Vector2(0,-1)
var velocity = Vector2()
var nose = false

func get_input():
    if Input.is_action_pressed("de"):
        velocity.x = 400
    if Input.is_action_pressed("iz"):
        velocity.x = -400
    if Input.is_action_just_released("de"):
        velocity.x = 0
    if Input.is_action_just_released("iz"):
        velocity.x = 0
				pass



func _physics_process(delta):
	get_input()
	velocity.y += 70
	if is_on_floor():
		velocity.y = 1
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y -= 900
	move_and_slide(velocity, vector_normal)
	pass


func _on_Area2D_area_entered(area):
	if area.name == "Barril":
		get_tree().change_scene("res://Escenas/Personaje/Nivel.tscn")
		queue_free()
	if area.name == "Barril2":
		get_tree().change_scene("res://Escenas/Personaje/Nivel.tscn")
		queue_free()
	if area.name == "Barril3":
		get_tree().change_scene("res://Escenas/Personaje/Nivel.tscn")
		queue_free()
	if area.name == "Enemigo":
		get_tree().change_scene("res://Escenas/Personaje/Nivel.tscn")
		queue_free()
		pass



func _on_Area2D_body_entered(body):
	if body.name == "Escalera":
		velocity.y += 0
	pass # Replace with function body.
