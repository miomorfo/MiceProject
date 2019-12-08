extends KinematicBody2D

#la clase Vector2 contiene el sistema de cordenadas para poder movernos por el escenario
var movimiento = Vector2()
const UP = Vector2(0, -1)
const GRAVEDAD = 60
const VELOCIDAD = 200
const ALTURA_SALTO = -800

func _physics_process(delta):
	#gravedad
	movimiento.y += GRAVEDAD
	
	#movimiento del personaje en el eje X
	if Input.is_action_pressed("ui_right"):
		movimiento.x = VELOCIDAD
	elif Input.is_action_pressed("ui_left"):
		movimiento.x = -VELOCIDAD
	else:
		#si no se presiona nada detener el personaje
		movimiento.x = 0
	
	#se detecta el suelo
	if is_on_floor():
		#print("el personaje está tocanto el suelo")
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = ALTURA_SALTO
		
	movimiento = move_and_slide(movimiento, UP)
	pass