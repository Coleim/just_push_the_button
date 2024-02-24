extends Node2D

var score = 0
var totalTime = 60

func format_time(time):
	var minutes = time / 60  # Get the total minutes
	var seconds = time % 60  # Get the remaining seconds
	# Format the string to "MM:SS"
	return "%02d:%02d" % [minutes, seconds]

func _ready():
	$TimerLabel.text = format_time(totalTime)
	$Timer.connect("timeout", _timerEnded)
	$Sprite2D.connect("input_event", _addScore)
	$Button.connect("pressed", _addScore)

func _process(delta):
	$ScoreLabel.text = "%06d" % [score]
	pass
	
#func _addScore(viewport, event, shape_idx):
func _addScore():
	score += 1
	#if  event is InputEventMouseButton and event.pressed:
		#print("lol it works")
		#score += 1
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _timerEnded():
	totalTime -= 1
	$TimerLabel.text = format_time(totalTime)
	#TODO: Stop game when time is 0
