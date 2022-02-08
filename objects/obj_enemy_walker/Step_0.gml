/// @description check if dead; if atk hitbox hits this object, it takes the atk damage

if (instance_exists(obj_hb_player_atk_parent)) {
	
	var _close_atk = obj_hb_player_atk_parent[0];
	var _this_atk;
	
	for (var i = 0; i < instance_number(obj_hb_player_atk_parent); i++) {
		
		_this_atk = obj_hb_player_atk_parent[i];
		
		if (distance_to_object(_this_atk) < distance_to_object(_close_atk)) {
			
			_close_atk = obj_hb_player_atk_parent[i];
			
		}
		
	}
	
	if (place_meeting(x, y, _close_atk) && !invincible) {
	
		health_current -= _close_atk.atk_damage;
		
		mve_dir = point_direction(obj_player.x, obj_player.y, x, y);
		mve_spd = mve_speed_recoil_recv;
		moving = true;
		alarmvar_mve = 0.075;
		alarmvar_inv = alarmvar_inv_default;
		
		invincible = true;
	
	}
}

if (health_current <= 0) {
	
	instance_destroy(self);
	
}


player_hit = place_meeting(x, y, obj_player);


#region random movement

var opt = irandom_range(0, 4);
if (player_hit) {
	
	opt = 0;

}


if (moving) {
	
	var spd = mve_speed * global.dt_steady;
	
	if (!player_hit) {
	
		mve_simple(spd, mve_dir);
	
		alarmvar_opt = 0;
		
	}
	else {
		
		alarmvar_mve = 0;
		moving = false;
		
	}
	
}
else if (alarmvar_opt <= 0) {
	
	switch(opt) {
		
		case 0 :
			mve_speed = 0;
			moving = true;
			alarmvar_mve = 1;
			break;
		
		case 1 :
			mve_speed = mve_spd_default;
			mve_dir = 0;
			moving = true;
			alarmvar_mve = 2;
			break;
		
		case 2 :
			mve_speed = mve_spd_default;
			mve_dir = 180;
			moving = true;
			alarmvar_mve = 2;
			break;
			
		case 3 :
			mve_speed = mve_spd_default;
			mve_dir = 90;
			moving = true;
			alarmvar_mve = 2;
			break;
		
		case 4 :
			mve_speed = mve_spd_default;
			mve_dir = 270;
			moving = true;
			alarmvar_mve = 2;
			break;
		
		
	}
	
}


alarmvar_mve -= global.dt_steady;
alarmvar_opt -= global.dt_steady;
alarmvar_inv -= global.dt_steady;
	
if (alarmvar_mve <= 0) {
	
	if (moving) {
		//pause and wait for 2 seconds before choosing new movement direction
		mve_speed = 0;
		moving = false;
		alarmvar_opt = 2;
	}
	alarmvar_mve = 0;
	
}

if (alarmvar_inv <= 0) {
	
	invincible = false;
	alarmvar_inv = 50000;

}

#endregion
