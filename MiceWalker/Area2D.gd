extends Area2D

export (int) var velocidad
var movimiento = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		movimiento.x =-1
		
	if movimiento.length() > 0:
		movimiento = movimiento.normalized() * velocidad
		
	position += movimiento * delta
	pass
