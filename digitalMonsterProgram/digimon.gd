extends StaticBody2D

class_name Digimon

@export var species_key : String # key for identifying digimon's species in digidict
var gene : Array  # the values determining various aspects of the digimon
var age : int = 0 # age of the digimon in minutes
var mood : int = 128 # how happy the digimon is
var hunger : int  = 0 # how hungry the digimon is
var speed : float = 1.0 # movement speed
var weight_mod : float # how heavy the digimon is from it's base
var weight : float # digimons weight
var nocturnal : bool # wether the digimon sleeps in the day or night
var color_mod : Color # random hue shift determined randomly
var activity : int # how much the digimon moves around


var target_direction : Vector2

func _init(sp, ge):
	species_key = sp
	gene = ge

func _ready() -> void:
	var species = Species.digidict[species_key]
	weight_mod = gene[0]
	weight = species[4] + weight_mod
	var noct_gene = gene[1]
	var red_gene = gene[2]
	var green_gene = gene[3]
	var blue_gene = gene[4]
	var act_gene = gene[5]
	if noct_gene < 7:
		nocturnal = true
	else :
		nocturnal = false
	color_mod = Color(red_gene, green_gene, blue_gene)
	
	activity = (act_gene%5)+1
	
	speed -= weight/10
	if speed <= 0:
		speed = 0.1
	
	var spr = Sprite2D.new()
	spr.texture = load(species[5])
	#spr.modulate = color_mod
	add_child(spr)
	
	var shape = CollisionShape2D.new()
	shape.shape = CircleShape2D.new()
	add_child(shape)
	
	var act_timer = Timer.new()
	act_timer.autostart = true
	act_timer.one_shot = false
	act_timer.wait_time = activity
	act_timer.timeout.connect(_on_acttimer_timeout)
	add_child(act_timer)

func _process(delta: float) -> void:
	move_and_collide(target_direction*Vector2(speed,speed))


func _on_acttimer_timeout():
	var will_move = randf_range(0.0,1.0)
	if will_move >= 0.3:
		target_direction = Vector2(randf_range(-1.0,1.0), randf_range(-1.0,1.0))
	else:
		target_direction = Vector2.ZERO
