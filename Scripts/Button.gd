extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if global.goNext:
		print("go")
		get_tree().change_scene("res://Scenes/Casa.tscn")
	else:
		print("not yet")
	#print(global.spots[0])
	#print(global.spots[1])
	#print(global.spots[2])
	#print(global.spots[3])
