extends Area2D

var mouseIn = false
var isGrabbing = false

var sprite_selected = preload("res://icon.png")

var index setget set_index, get_index
var target setget set_target, get_target
var points setget set_points, get_points

onready var offset = $default/Sprite.texture.get_size() * 1.2 
onready var offset_x = $default/Sprite.texture.get_width() * .5 

var size_x
var size_y

func _ready():
	size_x = self.transform.x
	size_y = self.transform.y
	pass

func _process(delta):
	global.time += delta
	if(mouseIn && Input.is_action_just_pressed('click') && !global.isNewGrabbed):
		isGrabbing = true
		global.isNewGrabbed = true
	
	if Input.is_action_just_released("click"):
		isGrabbing = false
		global.isNewGrabbed = false
	
	
	var paperArea1 = get_tree().get_root().get_child(1).get_child(0).get_child(1).get_child(0).get_overlapping_areas()
	var paperArea2 = get_tree().get_root().get_child(1).get_child(0).get_child(2).get_child(0).get_overlapping_areas()
	var paperArea3 = get_tree().get_root().get_child(1).get_child(0).get_child(3).get_child(0).get_overlapping_areas()
	var paperArea4 = get_tree().get_root().get_child(1).get_child(0).get_child(4).get_child(0).get_overlapping_areas()
	
	print(paperArea1.size())
	print(paperArea2.size())
	print(paperArea3.size())
	print(paperArea4.size())
	
	if paperArea1.size() == 2 and paperArea2.size() == 2 and paperArea3.size() == 2 and paperArea4.size() == 2:
		global.goNext = true
	else:
		global.goNext = false
	
	if isGrabbing:
		set_position(get_global_mouse_position())
		self.position -= offset	
		self.position.y -= (32 * index) + (index * 2)
		resizeObject(Vector2(.25,0), Vector2(0,.5))
	else:
		var areas = $ColisionArea.get_overlapping_areas()
		
		returnToPosition()
		
		for area in areas:
			if area.name == 'PaperArea' and areas.size() <= 2:# or area.name == 'PaperArea2' or area.name == 'PaperArea3' or area.name == 'PaperArea4':
				set_position(area.get_parent().position  - offset)
				self.position.x -= 10
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.82, 0), Vector2(0, 2))
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[0] = self
				$default.visible = false
				$area1.visible = true
				return
			elif area.name == "PaperArea2" and areas.size() <= 2:
				set_position(area.get_parent().position  - offset)
				self.position.x -= 8
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.4, 0), Vector2(0, 5))
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[1] = self
				$default.visible = false
				$area2.visible = true
				return
			elif area.name == "PaperArea3" and areas.size() <= 2:
				set_position(area.get_parent().position  - offset)
				self.position.x -= 10
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.4, 0), Vector2(0, 2.7))
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[2] = self
				$default.visible = false
				$area3.visible = true
				return
			elif area.name == "PaperArea4" and areas.size() <= 2:
				set_position(area.get_parent().position  - offset)
				self.position.x -= 10
				self.position.y -= 36 * index - (index * 1.2)
				resizeObject(Vector2(.4, 0), Vector2(0, 2.7))
				isGrabbing = false
				global.isNewGrabbed = false
				global.spots[3] = self
				$default.visible = false
				$area4.visible = true
				return
			if area.name == "New" and area != self:
				returnToPosition()

func set_index(new_index):
	index = new_index

func get_index():
	return index

func set_target(newtarget):
	target = newtarget

func get_target():
	return "target: " + target

func set_points(newpoints):
	points = newpoints

func get_points():
	return points

func resizeObject(sX, sY):
	self.position.x -= offset_x
	$CollisionShape2D.transform.x = sX
	$CollisionShape2D.transform.y = sY

func _on_New_mouse_entered():
	mouseIn = true

func _on_New_mouse_exited():
	mouseIn = false

func returnToPosition():
	$default.visible = true
	$area1.visible = false
	$area2.visible = false
	$area3.visible = false
	$area4.visible = false
	set_position(get_parent().position - offset)
	self.position.x -= offset_x
	resizeObject(Vector2(1, 0), Vector2(0, 1))
