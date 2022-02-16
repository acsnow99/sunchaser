/// @description check if dead; if atk hitbox hits this object, it takes the atk damage

sunlight_mod = 1;

if (instance_exists(obj_hb_player_atk_parent)) {
	
	var _close_atk = obj_hb_player_atk_parent[0];
	var _this_atk;
	
	for (var i = 0; i < instance_number(obj_hb_player_atk_parent); i++) {
		
		_this_atk = obj_hb_player_atk_parent[i];
		
		if (distance_to_object(_this_atk) < distance_to_object(_close_atk)) {
			
			_close_atk = obj_hb_player_atk_parent[i];
			
		}
		
	}
	
	if (place_meeting(x, y, _close_atk)) {
	
		health_current -= _close_atk.atk_damage;
	
	}
}

if (health_current <= 0) {
	
	instance_destroy(self);
	
}
