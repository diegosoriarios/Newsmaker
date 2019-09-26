extends RichTextLabel

var page = global.dialog_page

var dict = {}

func _ready():
	var file = File.new()
	file.open("res//Scripts/chooses.json", file.READ)
	var text = file.get_as_text()
	print(text)
	dict = parse_json(text)
	file.close()
	
	if global.dialog.size() > 0:
		set_bbcode(global.dialog[page])
		set_visible_characters(0)
		set_process_input(true)

func _input(event):
	if Input.is_action_just_pressed("click"):
		if get_visible_characters() > get_total_character_count():
			if page < global.dialog.size() - 1:
				page += 1
				set_bbcode(global.dialog[page])
				set_visible_characters(0)
			else:
				global.dialog_page = 0
				#$".".set_process(false)
				#$".".get_parent().hide()
				$".".get_parent().queue_free()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
