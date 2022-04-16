
global.items_count = 3;

global.items[0] = false;
global.items[1] = true;
global.items[2] = true;

//0 = no item; 1 = sword; 2 = lantern
global.item_equipped = 1;

global.keys = 0;
global.currency = 0;

//keeps track of how many hits the player has landed(0-2) 
global.combo = 0;


alarmvar_combo_end = 0;
alarmvar_combo_end_default = 1;



combo_update = function() {
	
	for (var i = 0; i < instance_number(obj_enemy_parent); i++) {
	
		var o = instance_find(obj_enemy_parent, i);
	
		if (o.health_current < o.health_last) {

			if (global.combo < 3) {
				
				global.combo += 1;
				alarmvar_combo_end = alarmvar_combo_end_default;
				
			}
		
			o.health_last = o.health_current;
		
		}
			
	}
	
	
	
	//give the player health for a completed combo
	if (global.combo >= 3) {
	
		if (health < global.health_max - 1) {
		
			health += 10;
			global.combo = 0;
		
		}
	
	}
	
	
	
	if (alarmvar_combo_end <= 0) {
		
		global.combo = 0;
		alarmvar_combo_end = alarmvar_combo_end_default;
		
	}
	
	alarmvar_combo_end -= global.dt_steady;
	
}

combo_end = function() {
	
	//reset all the enemies' values to prevent a combo from 
	//"appearing" after the player switches back to sword
	for (var i = 0; i < instance_number(obj_enemy_parent); i++) {
	
		var o = instance_find(obj_enemy_parent, i);
	
		if (o.health_current < o.health_last) {
		
			o.health_last = o.health_current;
		
		}
			
	}
	
	
	global.combo = 0;
	
}

