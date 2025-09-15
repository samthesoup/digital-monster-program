extends Sprite2D

class_name digiegg


@export var digimon_inside : String
@export_range(00000000000000,99999999999999,1.0) var gene : int  
@export var random_gene : bool

var hatch_timer = Timer.new()

func _ready() -> void:
	if random_gene:
		gene = randi_range(00000000000000,99999999999999)
	hatch_timer.autostart = true
	hatch_timer.one_shot = true
	hatch_timer.wait_time = 5.0
	add_child(hatch_timer)

func _process(delta: float) -> void:
	if hatch_timer.time_left <= 0.0:
		var d = Digimon.new(digimon_inside,gene)
		d.transform = transform
		get_tree().root.add_child(d)
		queue_free()
