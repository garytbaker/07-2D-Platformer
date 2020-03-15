extends Node


var Score = 0
var level = 1
var currentpos
var level1coins= [Vector2(96,228),Vector2(305,224),Vector2(182,160),Vector2(512,176)]
var level2coins= [Vector2(100,200),Vector2(300,150),Vector2(181,160),Vector2(896,0)]

func save():
	var saveDict = {}
	
	saveDict["Score"]=Score
	saveDict["level"]=level
	saveDict["level1coins"]=level1coins
	saveDict["level2coins"]=level2coins
	var file = File.new()
	if file.open("user://saved_game.sav", File.WRITE) != 0:
		print("Error opening file")
		return
	file.store_line(to_json(saveDict))
	print("saved")
	file.close()

func load():
	var file = File.new()
	if not file.file_exists("user://saved_game.sav"):
		print("No file saved!")
		return
	
	# Open existing file
	if file.open("user://saved_game.sav", File.READ) != 0:
		print("Error opening file")
		return
	
	# Get the data
	var data = {}
	data=parse_json(file.get_line())
	Score = data["Score"]
	level = data["level"]
	var level1coinsString=data["level1coins"]
	level1coins=[]
	for coin in level1coinsString:
		coin.erase(0,1)
		coin.erase(coin.length()-1,1)
		var coinArr=coin.split(',')
		level1coins.append(Vector2(coinArr[0],coinArr[1]))
	level2coins=[]
	var level2coinsString=data["level2coins"]
	for coin in level2coinsString:
		coin.erase(0,1)
		coin.erase(coin.length()-1,1)
		var coinArr=coin.split(',')
		level2coins.append(Vector2(coinArr[0],coinArr[1]))

	if level==1:
		get_tree().change_scene("res://World.tscn")
	if level==2:
		get_tree().change_scene("res://Level2.tscn")
