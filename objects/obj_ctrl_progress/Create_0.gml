
global.items_count = 3;

global.items[0] = false;
global.items[1] = true;
global.items[2] = true;


//general progress checkpoints
// -1=file not started
// 0=beginning
global.progress = -1;


//0 = no item; 1 = sword; 2 = lantern
global.item_equipped = 1;

global.keys = 0;
global.currency = 0;

global.atk_types_count = 3;
global.atk_types[0] = obj_hb_player_atk_basic;
global.atk_types[1] = obj_hb_player_atk_lantern;
global.atk_types[2] = obj_hb_player_atk_sp;

global.fx_destroy[0] = obj_fx_destroy_basic;
global.fx_destroy[1] = obj_fx_destroy_fire;
global.fx_destroy[2] = obj_fx_destroy_sun;


//keeps track of how many hits the player has landed(0-2) 
global.combo = 0;


global.health_max = 50;
health = global.health_max;

global.level = 0;

global.debug = false;

global.alarmvar_runtime = 0;


global.start_x = 0;
global.start_y = 0;


alarmvar_combo_end = 0;
alarmvar_combo_end_default = 1;



restart_level = function() {
	
	respawn_player();
	
	global.combo = 0;
	
	global.sunlight_level = 4;
	obj_ctrl_daylight.sunbox_assign(global.sunlight_level);
	
	health = 50;
	
	with (obj_player) {
		
		reset_all();
		
	}
	
}



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
	if (global.combo > 0) {
		
		alarmvar_combo_end -= global.dt_steady;
		
	}
	
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


respawn_player = function() {
	
	if (room != rm_setup && room != rm_title) {
	
		if (instance_exists(obj_player)) {
		
			obj_player.x = global.start_x;
			obj_player.y = global.start_y;
		
			return true;
		
		}
	
	}
	
}


