extends Node2D

var entered = false

func _process(delta):
	if entered:
		if Input.is_action_just_pressed("click"):
			$".".get_parent().get_node("Dialogue").set_process(true)
			$".".get_parent().get_node("Dialogue").show()
			global.dialog.append("Segundo teste")
			global.dialog_page = 0


func _on_Area2D_mouse_exited():
	entered = false
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	entered = true
	pass # Replace with function body.
