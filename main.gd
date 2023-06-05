extends Control

#import godot.gdnative
#import godot.gdnative as godot
#import godot_tools
#
#var FileAccess = godot.FileAccess

#import Engine

@onready var textEdit = $TextEdit

var text

func _unhandled_input(event):
	if Input.is_action_just_pressed("save"):
		text = textEdit.get_text()
		save(text)
	else:
		pass

func save(text):
	
	var file = FileAccess.open("user://text.txt", FileAccess.WRITE)
	file.seek_end()
	file.store_string(text)
	file.close()

func load():
	var file = FileAccess.open("user://text.txt", FileAccess.READ)
	var textInFile = file.get_as_text()
	file.close()
	
	return textInFile
