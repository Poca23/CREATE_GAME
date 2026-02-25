extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("GAME OVER")
	await $MessageTimer.timeout
	
	$Message.text = "DODGE THE ENEMIES!"
	$Message.show()
	
	await get_tree() .create_timer(1.0).timeout
	$Startbutton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)



func _on_startbutton_pressed():
	$Startbutton.hide()
	start_game.emit()
	

func _on_message_timer_timeout():
	$Message.hide()
