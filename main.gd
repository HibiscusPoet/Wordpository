extends Control

#import godot.gdnative
#import godot.gdnative as godot
#import godot_tools
#
#var FileAccess = godot.FileAccess

#import Engine

@onready var textEdit = $TextEdit
@onready var progressBar = $HBoxContainer2/ProgressBar


var text
var goal = 1

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

func CountWordInString(string:String):
	var wordTotal = -1
	var previousSpace = 0
	
	while (previousSpace != -1):
		previousSpace = string.find(" ", previousSpace + 1)
		wordTotal += 1
	
	return wordTotal

func _on_text_edit_text_changed():
	var currentWord = CountWordInString($TextEdit.text)
	progressBar.value = (currentWord / goal) * 100
	#divide small number by big number and multiply by 100

func _on_spin_box_value_changed(value):
	goal = value
