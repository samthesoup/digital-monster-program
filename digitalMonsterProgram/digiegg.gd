extends Sprite2D

class_name digiegg


@export var digimon_inside : String
@export var gene = [0,00,000,000,000,00]
@export var random_gene : bool

var hatch_timer = Timer.new()

func _ready() -> void:
	if random_gene:
		gene[0] = randf_range(0.0,1.0)
		gene[1] = randi_range(0,10)
		gene[2] = randf_range(0.0,1.0)
		gene[3] = randf_range(0.0,1.0)
		gene[4] = randf_range(0.0,1.0)
		gene[5] = randi_range(0,99)
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
