extends StaticBody2D

class_name Digimon

@export var species_key : String # key for identifying digimon's species in digidict
@export_range(10000000000000,99999999999999,1.0) var gene : int  # the random value determining various aspects of the digimon
@export var random_gene : bool
var age : int = 0 # age of the digimon in hours
var mood : int = 128 # how happy the digimon is
var hunger : int  = 0 # how hungry the digimon is
var weight_mod : int # how heavy the digimon is from it's base
var nocturnal : bool # wether the digimon sleeps in the day or night
var color_mod : Color # random hue shift determined randomly
var activity : int # how much the digimon moves around

func _ready() -> void:
	if random_gene:
		gene = randi_range(10000000000000,99999999999999)
	var species = Species.digidict[species_key]
	weight_mod = get_gene(gene,1,0)
	var noct_gene = get_gene(gene,2,1)
	var red_gene = get_gene(gene,3,3)
	var green_gene = get_gene(gene,3,6)
	var blue_gene = get_gene(gene,3,9)
	var act_gene = get_gene(gene,2,12)
	if noct_gene < 7:
		nocturnal = true
	else :
		nocturnal = false
	
	color_mod = Color(red_gene%256, green_gene%256, blue_gene%256)
	
	activity = act_gene + 1
	
	var spr = Sprite2D.new()
	spr.texture = load(species[5])
	spr.modulate = color_mod
	add_child(spr)

func get_gene(g, count, offset):
	var shift = 10^offset
	var digits = 10^count
	g = int(g / shift)
	var result = int(g%digits)
	return result
