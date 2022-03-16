

global.levels_initiated = false;

spawners_initiated = false;

lvl_previous = 0;


levels_init = function() {
	
	global.level_count = instance_number(obj_level_frame) - 1;

	for (var i = 0; i <= global.level_count; i++) {
	
		var _this_frame = instance_find(obj_level_frame, i);
	
		//mins and maxes for each level's camera reach
		global.levels[i, 0] = _this_frame.x;
		global.levels[i, 1] = global.levels[i, 0] + _this_frame.sprite_width;
		global.levels[i, 2] = _this_frame.y;
		global.levels[i, 3] = global.levels[i, 2] + _this_frame.sprite_height;
	
	
	}
	
	return true;

}



level_seek = function(_focusx, _focusy) {
	
	for (var i = 0; i < instance_number(obj_level_frame); i++) {
		
		var _min_x = global.levels[i, 0];
		var _max_x = global.levels[i, 1];
		
		var _min_y = global.levels[i, 2];
		var _max_y = global.levels[i, 3];
		
		if (_focusx >= _min_x && _focusx <= _max_x && _focusy >= _min_y && _focusy <= _max_y) {
			
			return i;
			exit;
		
		}
		
	}
	
}



enemy_spawner_init = function() {
	
	for (var i = 0; i < instance_number(obj_enemy_spawner); i++) {
		
		var obj = instance_find(obj_enemy_spawner, i);
		
		obj.level = level_seek(obj.x, obj.y);
		
	}
	
	return true;
	
}


enemy_cleanup = function() {
	
	
	for (var i = 0; i < instance_number(obj_enemy_spawner); i++) {
		
		var obj = instance_find(obj_enemy_spawner, i);
		
		if (obj.level != global.level) {
			
			with (obj) {
				
				instance_destroy(liege);
				
			}
			
		}
		
	}
	
}


enemy_spawn = function() {
	
	//if it's nighttime(sunlight is higher than the nighttime threshold) then different enemies spawn
	var light = global.sunlight_current > global.nighttime_trigger;
	
	for (var i = 0; i < instance_number(obj_enemy_spawner); i++) {
		
		var obj = instance_find(obj_enemy_spawner, i);
			
		with (obj) {
				
			if (level == global.level) {
				
				liege = instance_create_layer(x, y, "Instances", enemy[light]);
					
			}
			
		}
		
	}
	
	
}
