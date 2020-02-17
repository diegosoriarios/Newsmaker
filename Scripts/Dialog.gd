extends Area2D

onready var dialog = $"."
var index = 0
var showing_text = []
var name_text = ""

func generateDialog():
	var file = File.new()
	file.open("res://callings.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	var whoIsCalling
	if json_result[str(global.dia)].size() == 1:
		whoIsCalling = 0
	else:
		var diff = global.governmentPoints - global.rebelPoints
		if diff > 0:
			whoIsCalling = 0
		elif diff < 0:
			whoIsCalling = 1
		else:
			whoIsCalling = 2
	print(json_result[str(global.dia)][whoIsCalling].text)
	showing_text = json_result[str(global.dia)][whoIsCalling].text
	name_text = json_result[str(global.dia)][whoIsCalling].name

func _ready():
	generateDialog()
	$DialogText.text = showing_text[index]
	$NameText.text = name_text

func _input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		if index < showing_text.size() - 1:
			index += 1
			$DialogText.text = showing_text[index]
		else:
			dialog.visible = false
			print(dialog)
	#if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed:
	#	print("Clicked")
