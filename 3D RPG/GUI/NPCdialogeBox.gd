extends Control
# An NPC calls this script through the get_tree().call_group("NPC", "change_text", "text")
# This makes a popup text box appear when an NPC is speaking.

func change_text(text, time):
	$Text.text = text
	$Text.show()
	$Timer.wait_time = time
	$Timer.start()


func _on_Timer_timeout():
	$Text.hide()
	$Text.text = "Nothing to show"
