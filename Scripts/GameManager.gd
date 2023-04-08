tool 
extends EditorScript

enum {ROCK, PAPER, SCISSORS}
enum {WIN, LOSE, TIE}
const MAX_MEM = 100 # you can remember the previous 100 throws

var Opponent = load("res://Scripts/Opponent.gd")
var rng = RandomNumberGenerator.new()
var opps = []
var round_history = []

func read_in_opps():
	var file = File.new()
	file.open("res://Assets/Files/Opponents.txt", File.READ)
	var blocks = file.get_as_text().split(";")
	for block in blocks:
		if(len(block.strip_edges()) > 0):
			opps.append(Opponent.new(block.strip_edges())) 

# returns a move for the player
func op_throw(op, history):
	rng.randomize()
	if op.id == 1: 
		return rng.randi_range(ROCK, SCISSORS)
	else: # random strat
		return rng.randi_range(ROCK, SCISSORS)
		

func play_throw(p_throw, op_throw):
	if len(round_history) == MAX_MEM:
		round_history.pop_back()
		
	round_history.push_front([p_throw, op_throw])
	
	if p_throw == op_throw:
		return TIE
		
	if p_throw == ROCK:
		if op_throw == SCISSORS:
			return WIN
		return LOSE
		
	if p_throw == PAPER:
		if op_throw == SCISSORS:
			return LOSE
		return WIN
		
	if p_throw == SCISSORS:
		if op_throw == ROCK:
			return LOSE
		return WIN

func play_round():
	return 0

func play_match(id):
	return 0

func _run():
	read_in_opps()
