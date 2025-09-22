extends RichTextLabel

var time

func _ready() -> void:
	time = $"../ProgressBar"

func _process(delta):
	set_text(str(time.value))
