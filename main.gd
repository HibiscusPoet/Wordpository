extends Control

#import godot.gdnative
#import godot.gdnative as godot
#import godot_tools
#
#var FileAccess = godot.FileAccess

import Engine

@onready var textEdit = $TextEdit

var text

func _unhandled_input(event):
	if Input.is_action_just_pressed("save"):
		text = textEdit.get_text()
		save(text)

func save(text):
	var file = File.new()
	file.open("user://text.txt", File.WRITE)
	file.store_string(text)
	file.close()

func load():
	var file = File.new()
	file.open("user://text.txt", File.READ)
	var textInFile = file.get_as_text()
	file.close()
	
	return textInFile
