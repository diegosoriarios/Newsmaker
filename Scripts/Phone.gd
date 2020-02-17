extends Area2D

var dialog

func _ready():
	randomize()
	dialog = get_tree().get_root().get_child(1).get_child(6)

func _process(_delta):
	if global.time > rand_range(30, 70):
		global.isRinging = true

func _input_event(_viewport, event, _shape_idx):
	if event.is_pressed() and global.isRinging:
		print(dialog)
		dialog.visible = true
		global.isRinging = false
	#if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed:
	#	print("Clicked")
