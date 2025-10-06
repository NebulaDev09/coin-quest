extends TextureRect

@onready var play = $Play
@onready var back = $Back
@onready var title_label = $Title
@onready var description_label = $description

var description: String
var title: String

signal _play()

func _ready():
	title_label.text = title
	description_label.text = description

func _on_play_pressed() -> void:
	emit_signal("_play")

func _on_back_pressed() -> void:
	queue_free()
