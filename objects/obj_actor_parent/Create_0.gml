
spr = spr_player_complete;
draw_color = c_white;
image_speed = 0;
image_index = 0;
image_alpha = 1;


path_current = p_cutscene_0_0;
mve_spd = 400;
mve_dir = 0;

mve_state = 0;

xtarg = 0;
ytarg = 0;


start_movement = function(path) {
	
	
	path_current = path;
	
	mve_spd = path_get_speed(path, 0);
	
	
	var trigg = -1; 
	if (instance_exists(obj_cutscene_trigg_parent)) {
		trigg = instance_nearest(x, y, obj_cutscene_trigg_parent);
	}
	xtarg = trigg.x;
	ytarg = trigg.y;
	
	mve_dir = point_direction(x, y, xtarg, ytarg);
	
	
	
	mve_state = 1;
	
}

movement = function() {
	
	var spd = mve_spd * global.dt_steady;
	
	mve_simple(spd, mve_dir);
	
	
	if (x >= xtarg - 10 && x <= xtarg + 10 && y >= ytarg - 10 && y <= ytarg + 10) {
		
		movement_path_start();
		
	}
	
	
}

movement_path_start = function() {
	
	path_start(path_current, mve_spd, path_action_stop, true);
	
	mve_state = 2;
	
}

movement_path = function() {
	
	path_speed = mve_spd * global.dt_steady;
	
	if (path_position >= 0.9) {
		
		end_movement();
		
	}
	
}

end_movement = function() {
	
	path_end();
	
	mve_state = 0;
	global.cutscene_act += 1;
	
}

