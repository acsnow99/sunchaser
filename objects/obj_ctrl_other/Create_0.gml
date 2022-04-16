
global.health_max = 50;
health = global.health_max;

global.level = 0;

global.debug = false;

global.pause = false;
deactivated = false;

global.alarmvar_runtime = 0;

map_spr = spr_map_grid_160x160;
grid_square_width = 64;
map_darkness_offset = 0.1;


start_x = 0;
start_y = 0;




restart_level = function() {
	
	obj_player.x = start_x;
	obj_player.y = start_y;
	
	global.combo = 0;
	
	global.sunlight_level = 2;
	obj_ctrl_daylight.sunbox_assign(global.sunlight_level);
	
	health = 50;
	
	with (obj_player) {
		
		reset_all();
		
	}
	
}
