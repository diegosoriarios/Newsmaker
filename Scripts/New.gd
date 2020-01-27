extends Area2D

var mouseIn = false
var isGrabbing = false

onready var offset = $Sprite.texture.get_size() * 1.2
onready var offset_x = $Sprite.texture.get_width() * .5

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if(mouseIn && Input.is_action_pressed('click')):
		isGrabbing = true
	
	if Input.is_action_just_released("click"):
		isGrabbing = false
	
	if isGrabbing:
		set_position(get_global_mouse_position())
		self.position -= offset
		self.position.x -= offset_x
	else:
		var areas = get_overlapping_areas()
		
		set_position(get_parent().position - offset)
		self.position.x -= offset_x
		
		for area in areas:
			print(area.name)
			if area.name == 'PaperArea' or area.name == 'PaperArea2' or area.name == 'PaperArea3' or area.name == 'PaperArea4':
				set_position(area.get_parent().position  - offset)
				self.position.x -= offset_x
				#Change to Sprite1
				isGrabbing = false
				return

func _on_New_mouse_entered():
	mouseIn = true

func _on_New_mouse_exited():
	mouseIn = false
