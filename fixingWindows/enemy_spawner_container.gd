extends Spatial

# Declare member variables here. Examples:
var zombie_prefab = preload("res://Zombie.tscn")
var enemy_per_wave = 2
var num_enemies_spawned = 0
onready var s_point1 = $spawn_point1 
onready var s_point2 = $spawn_point2 
onready var s_point3 = $spawn_point3 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If all zombies in the wave are dead do this
	if (num_enemies_spawned != enemy_per_wave):
		var rand = rand_range(1,3)
		print(rand)		
		
		if (rand == 1):
			var enemy = zombie_prefab.instance()
			enemy.transform.origin = s_point1.get_global_transform().get_translation()
		
		if (rand == 2):
			var enemy = zombie_prefab.instance()
			enemy.transform.origin = s_point2.get_global_transform().get_translation()
		
		if (rand == 3):
			var enemy = zombie_prefab.instance()
			enemy.transform.origin = s_point3.get_global_transform().get_translation()
		
		num_enemies_spawned = num_enemies_spawned + 1
		
	if (num_enemies_spawned == enemy_per_wave):
		num_enemies_spawned = 0
	enemy_per_wave = enemy_per_wave + 1
