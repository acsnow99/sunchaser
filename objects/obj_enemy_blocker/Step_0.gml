/// @description check if dead; if atk hitbox hits this object, it takes the atk damage

var lvl = scr_lvl_check(x, y);

if (!lvl == global.level) {
	
	exit;

}

if (instance_exists(obj_hb_player_atk_sp)) {
	
	var _close_atk = obj_hb_player_atk_sp[0];
	var _this_atk;
	
	for (var i = 0; i < instance_number(obj_hb_player_atk_sp); i++) {
		
		_this_atk = obj_hb_player_atk_sp[i];
		
		if (distance_to_object(_this_atk) < distance_to_object(_close_atk)) {
			
			_close_atk = _this_atk; 
			
		}
		
	}
	
	if (place_meeting(x, y, _close_atk) && !invincible) {
	
		health_current -= _close_atk.atk_damage;
		
		alarmvar_inv = alarmvar_inv_default;
		invincible = true;
	
	}
}

if (health_current <= 0) {
	
	instance_destroy(self);
	
}


