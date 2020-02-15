extends Node

export(Array, PackedScene) var news = []

onready var newsPlaces = [$Position2D, $Position2D2, $Position2D3, $Position2D4, $Position2D5, $Position2D6, $Position2D7]
var index = 0
var positions = [1 + (global.dia * 7), 2 + (global.dia * 7), 3 + (global.dia * 7), 4 + (global.dia * 7), 5 + (global.dia * 7), 6 + (global.dia * 7), 7 + (global.dia * 7)]

func generateNews(item):
	var file = File.new()
	file.open("res://data.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	#print(json_result[str(index)].target.points)
	item.get_node("Control/Label").set_text(json_result[str(positions[index])].text)
	var texture = preload("res://icon.png")
	item.get_node("icon").set_texture(texture)
	index += 1

func _ready():
	randomize()
	positions.shuffle()
	for index in newsPlaces.size():
		var New = news[index]
		var new = New.instance()
		new.set_index(index)
		generateNews(new)
		newsPlaces[index].add_child(new)
