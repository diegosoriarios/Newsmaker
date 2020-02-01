extends Area2D

var mouseIn = false
var isGrabbing = false

var sprite_selected = preload("res://icon.png")

var index setget set_index

onready var offset = $Sprite.texture.get_size() * 1.2 
onready var offset_x = $Sprite.texture.get_width() * .5 

var size_x
var size_y

func _ready():
	size_x = self.transform.x
	size_y = self.transform.y
	pass
	
func _process(delta):
	if(mouseIn && Input.is_action_pressed('click') && !global.isNewGrabbed):
		isGrabbing = true
		global.isNewGrabbed = true
	
	if Input.is_action_just_released("click"):
		isGrabbing = false
		global.isNewGrabbed = false
	
	if isGrabbing:
		set_position(get_global_mouse_position())
		self.position -= offset	
		self.position.y -= (32 * index) + (index * 2)
		resizeObject(Vector2(.25,0), Vector2(0,.5))
	else:
		var areas = $ColisionArea.get_overlapping_areas()
		
		returnToPosition()
		
		for area in areas:
			print(area.name)
			if area.name == 'PaperArea':# or area.name == 'PaperArea2' or area.name == 'PaperArea3' or area.name == 'PaperArea4':
				set_position(area.get_parent().position  - offset)
				#resizeObject(size_x, size_y)
				self.position.x -= 10
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.82, 0), Vector2(0, 2))
				#Change to Sprite1
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[0] = self
				return
			elif area.name == "PaperArea2":
				set_position(area.get_parent().position  - offset)
				self.position.x -= 8
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.4, 0), Vector2(0, 5))
				#Change to Sprite1
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[1] = self
				return
			elif area.name == "PaperArea3":
				set_position(area.get_parent().position  - offset)
				#resizeObject(area.get_child(0).transform.x, area.get_child(0).transform.y)
				self.position.x -= 10
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.4, 0), Vector2(0, 2.7))
				#Change to Sprite1
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[2] = self
				return
			elif area.name == "PaperArea4":
				set_position(area.get_parent().position  - offset)
				#resizeObject(area.get_child(0).transform.x, area.get_child(0).transform.y)
				self.position.x -= 10
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.4, 0), Vector2(0, 2.7))
				#Change to Sprite1
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[3] = self
				return
			

func set_index(new_index):
	index = new_index

func resizeObject(sX, sY):
	self.position.x -= offset_x
	self.transform.x = sX
	self.transform.y = sY
	$CollisionShape2D.transform.x = sX
	$CollisionShape2D.transform.y = sY

func _on_New_mouse_entered():
	mouseIn = true

func _on_New_mouse_exited():
	mouseIn = false

func returnToPosition():
	set_position(get_parent().position - offset)
	self.position.x -= offset_x
	resizeObject(Vector2(1, 0), Vector2(0, 1))