

global.levels_initiated = false;

spawners_initiated = false;

lvl_previous = 0;

/*
map_width = 10;
level_width = sprite_get_width(spr_level);
level_height = sprite_get_height(spr_level);
*/


levels_init = function() {
	
	global.level_count = instance_number(obj_level_frame) - 1;

	for (var i = 0; i <= global.level_count; i++) {
		
		/*
		var o = i;
		
		#region sorting out where the level being looked at is
		var p = 0;
		
		for (var e = 0; e > 1; e--) {
		
			if (o >= map_width) {
			
				o -= map_width;
				p++;
			
			}
			else {
				
				e = 3;
				
			}
			
		}
		#endregion
		
		
		var _x = o * level_width;
		var _y = p * level_height;
		*/
	
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
	
	return -1;
	
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
				
				if (instance_exists(liege)) {
				
					instance_destroy(liege);
					
				}
				
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



check_outside_room = function() {
	
	/*
	var m = global.sunbox_count

	if (obj_player.x < 0) {
	
		obj_player.x = room_width - 16;
	
	}

	if (obj_player.x > room_width) {
	
		obj_player.x = 0 + 16;
	
	}*/
	
	with (obj_player) {
		
		var obj = instance_nearest(x, y, obj_tp_parent);
		
		if place_meeting(x, y, obj) {
			
			var obj_endpt = obj.tp_endpoint;
			
			var off_x = obj_endpt.side_x * 32;
			var off_y = obj_endpt.side_y * 32;
			
			x = obj_endpt.x + off_x;
			y = obj_endpt.y + off_y;
			
		}
		
	}
	
}



