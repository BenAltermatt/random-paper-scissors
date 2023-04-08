extends Node

export(Texture) var hover
export(Texture) var pressed
export(Texture) var normal
export(String) var text

func _ready():
	get_node("TextureButton").texture_normal = normal
	get_node("TextureButton").texture_pressed = pressed
	get_node("TextureButton").texture_hover = hover
	get_node("RichTextLabel").text = ""
	get_node("RichTextLabel").append_bbcode(text)

