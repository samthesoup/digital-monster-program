extends StaticBody2D

class_name digimon

@export var species : String # key for identifying digimon's species in digidict
@export var gene : int # the random value determining various aspects of the digimon
var age : int = 0 # age of the digimon in hours
var mood : int = 128 # how happy the digimon is
var hunger : int  = 0 # how hungry the digimon is
var weight_mod : int # how heavy the digimon is from it's base
var nocturnal : bool # wether the digimon sleeps in the day or night
var color_mod : Color # random hue shift determined randomly
var activity : int # how much the digimon moves around
var aggression : int # how likely the digimon is to fight

func _init(g, noc) -> void:
	gene = g
	weight_mod = get_gene(gene,1,0)
	var noct_gene = get_gene(gene,2,1)
	var red_gene = get_gene(gene,3,3)
	var green_gene = get_gene(gene,3,6)
	var blue_gene = get_gene(gene,3,9)
	var act_gene = get_gene(gene,2,12)
	var agg_gene = get_gene(gene,2,14)
	if noct_gene < 7:
		nocturnal = noc 
	else :
		nocturnal = !noc
	
	color_mod = Color(red_gene%256, green_gene%256, blue_gene%256)
	
	activity = act_gene + 1
	
	aggression = agg_gene

func get_gene(gene, count, offset):
	var shift = 10^offset
	var digits = 10^count
	gene = int(gene / shift)
	var result = int(gene%digits)
	return result
