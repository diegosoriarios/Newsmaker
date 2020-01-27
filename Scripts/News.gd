extends Node

export(Array, PackedScene) var news = []

onready var newsPlaces = [$Position2D, $Position2D2, $Position2D3, $Position2D4, $Position2D5, $Position2D6, $Position2D7]

func _ready():
	news.shuffle()
	for index in newsPlaces.size():
		var New = news[index]
		var new = New.instance()
		new.set_index(index)
		newsPlaces[index].add_child(new)
