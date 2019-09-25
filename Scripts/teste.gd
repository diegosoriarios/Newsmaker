extends Sprite

var mouseIn = false
var isGrabbing = false

var pos = Vector2(0,0)

var point = rand_range(-2,5)

var sprite_selected = preload("../icon.png")

func _ready():
	pos = Vector2($".".position.x, $".".position.y)
	pass

func _process(delta):
	if(mouseIn == true && Input.is_action_pressed('click')):
		isGrabbing = true
		
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	if(Input.is_action_just_released("click")):
		isGrabbing = false

	if isGrabbing:
		set_position(get_viewport().get_mouse_position())
	else:
		var areas = $Area2D.get_overlapping_areas()
		
		for area in areas:
			if area.name == 'PaperArea':
				set_position(area.get_parent().position)
				#Change to Sprite1
				isGrabbing = false
				return
			elif area.name == 'PaperArea2':
				#Change to Sprite2
				set_position(area.get_parent().position)
				isGrabbing = false
				return
			elif area.name == 'PaperArea3':
				set_position(area.get_parent().position)
				isGrabbing = false
				return
				#Change to Sprite3
			elif area.name == 'PaperArea4':
				set_position(area.get_parent().position)
				isGrabbing = false
				return
				#Change to Sprite4
			elif area.name == 'Area2D':
				set_position(pos)
				isGrabbing = false
				return
		set_position(pos)

func _on_Area2D_mouse_entered():
	mouseIn = true
	pass


func _on_Area2D_mouse_exited():
	mouseIn = false
	pass
