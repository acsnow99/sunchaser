/// @description enemy attributes. Health, speed, etc.

health_max = 30;
health_current = health_max;

invincible = false;

dir_sprites[0, 0] = spr_walker_idle_lr;
dir_sprites[1, 0] = spr_walker_idle_up;
dir_sprites[2, 0] = spr_walker_idle_lr;
dir_sprites[3, 0] = spr_walker_idle_dwn;
dir_sprites[0, 1] = spr_walker_run_lr;
dir_sprites[1, 1] = spr_walker_run_up;
dir_sprites[2, 1] = spr_walker_run_lr;
dir_sprites[3, 1] = spr_walker_run_dwn;
dir_sprites[0, 2] = spr_walker_run_lr;
dir_sprites[1, 2] = spr_walker_run_up;
dir_sprites[2, 2] = spr_walker_run_lr;
dir_sprites[3, 2] = spr_walker_run_dwn;

spr_current = dir_sprites[0, 0];

animation_pos = 0;
animation_length_current = 1;

moving = false;
mve_state = 0;
mve_spd_default = 75;
mve_speed = 75;
mve_speed_recoil_recv = 250;
mve_dir = 0;
dir_last = 0;
//how long until randomly assigning new movement pattern
alarmvar_mve_default = 0.75;
alarmvar_mve = alarmvar_mve_default;
alarmvar_opt = 0;
alarmvar_inv = 0;
alarmvar_ghost_frame = 0;
alarmvar_ghost_frame_default = 0.1;
recoil_time_default = 0.075;
pause_time_default = 1;
//default invincibility frames
alarmvar_inv_default = 0.3





movement_normal = function() {
	
	
	//if this object hit the player
	var player_hit = place_meeting(x, y, obj_player);
	if (player_hit) {
	
		start_recoil(false);
		exit;

	}
	
	
	//if this object was hit with an attack(if returns true, obj takes dmg)
	var this_hit = check_dmg();
	if (this_hit) {
		
		//start recoil reaction
		start_recoil(true);
		exit;
		
	}
	
	
	if (health_current <= 0) {
	
		die();
	
	}


	#region random movement


	var opt = irandom_range(0, 4);

	if (moving) {
	
		var spd = mve_speed * global.dt_steady;
	
		mve_simple(spd, mve_dir);
	
		alarmvar_opt = 0;
	
	}
	else if (alarmvar_opt <= 0) {
	
		switch(opt) {
		
			case 0 :
				mve_speed = 0;
				moving = true;
				alarmvar_mve = pause_time_default;
				break;
		
			case 1 :
				mve_speed = mve_spd_default;
				mve_dir = 0;
				moving = true;
				alarmvar_mve = alarmvar_mve_default;
				break;
		
			case 2 :
				mve_speed = mve_spd_default;
				mve_dir = 180;
				moving = true;
				alarmvar_mve = alarmvar_mve_default;
				break;
			
			case 3 :
				mve_speed = mve_spd_default;
				mve_dir = 90;
				moving = true;
				alarmvar_mve = alarmvar_mve_default;
				break;
		
			case 4 :
				mve_speed = mve_spd_default;
				mve_dir = 270;
				moving = true;
				alarmvar_mve = alarmvar_mve_default;
				break;
		
		
		}
	
	}

	
	if (alarmvar_mve <= 0) {
	
		if (moving) {
			//pause and wait for 2 seconds before choosing new movement direction
			mve_speed = 0;
			moving = false;
			alarmvar_opt = pause_time_default;
		}
		//if obj is already still, just wait until alarmvar_opt goes off
		alarmvar_mve = 0;
	
	}

	if (alarmvar_inv <= 0) {
	
		invincible = false;

	}
	
	
	
#endregion	

	alarmvar_mve -= global.dt_steady;
	alarmvar_opt -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;

	mve_state = moving;
	
}



movement_recoil = function() {
	
	var spd = mve_spd * global.dt_steady;
	var dir = mve_dir;
	
	mve_simple(spd, dir);
	check_dmg();
	
	if (alarmvar_mve <= 0) {
		
		stop_recoil();
		
	}
	
	if (alarmvar_inv <= 0) {
		
		invincible = false;
		
	}
	
	alarmvar_mve -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;
	
}



start_recoil = function(inv) {
	
		
	mve_dir = point_direction(obj_player.x, obj_player.y, x, y);
	mve_spd = mve_speed_recoil_recv;
	moving = true;
	alarmvar_mve = recoil_time_default;
	
	mve_state = 2;
	
	if (inv) {
	
		alarmvar_inv = alarmvar_inv_default;
		invincible = true;
	
	}
	
	
}

stop_recoil = function() {
	
	moving = false;
	alarmvar_mve = 0;
	alarmvar_opt = pause_time_default;
	
	mve_state = 0;
	
}



check_dmg = function() {

	if (instance_exists(obj_hb_player_atk_parent)) {
	
		var _close_atk = obj_hb_player_atk_parent[0];
		var _this_atk;
	
		for (var i = 0; i < instance_number(obj_hb_player_atk_parent); i++) {
		
			_this_atk = obj_hb_player_atk_parent[i];
		
			if (distance_to_object(_this_atk) < distance_to_object(_close_atk)) {
			
				_close_atk = _this_atk;
			
			}
		
		}
	
		if (place_meeting(x, y, _close_atk) && !invincible) {
	
			health_current -= _close_atk.atk_damage;
			return true;

		}
		else {
			
			return false;
			
		}
	}
	else {
		
		return false;
		
	}
}


die = function() {
	
	instance_destroy(self);
	
}

