extends Control

func change_text(text):
	$Text.text = text
	$Text.show()
	$Timer.start()


func _on_Timer_timeout():
	$Text.hide()
	$Text.text = "Nothing to show"
