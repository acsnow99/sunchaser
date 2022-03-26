/// @description enemy attributes. Health, speed, etc.

health_max = 50;
health_current = health_max;

invincible = false;

dir_sprites[0, 0] = spr_bandit;
dir_sprites[1, 0] = spr_bandit;
dir_sprites[2, 0] = spr_bandit;
dir_sprites[3, 0] = spr_bandit;
dir_sprites[0, 1] = spr_bandit;
dir_sprites[1, 1] = spr_bandit;
dir_sprites[2, 1] = spr_bandit;
dir_sprites[3, 1] = spr_bandit;
dir_sprites[0, 2] = spr_bandit;
dir_sprites[1, 2] = spr_bandit;
dir_sprites[2, 2] = spr_bandit;
dir_sprites[3, 2] = spr_bandit;
dir_sprites[0, 3] = spr_bandit;
dir_sprites[1, 3] = spr_bandit;
dir_sprites[2, 3] = spr_bandit;
dir_sprites[3, 3] = spr_bandit;

directions[0] = 270;
directions[1] = 90;

spr_current = dir_sprites[0, 0];

animation_pos = 0;
animation_length_current = 1;

image_xscale_default = image_xscale;

moving = false;
attacked = false;
mve_state = 0;
mve_spd_default = 300;
mve_speed = 300;
mve_speed_recoil_recv = 400;
mve_speed_atk = mve_speed * 2;
mve_dir = 0;
dir_last = 0;
atk_dist = 100;
//how long until randomly assigning new movement pattern
alarmvar_mve_default = 0.75;
atk_length_default = 0.15;
alarmvar_atk = 0;
alarmvar_mve = 0;
alarmvar_inv = 0;
alarmvar_ghost_frame = 0;
alarmvar_ghost_frame_default = 0.1;
recoil_time_default = 0.075;
//default invincibility frames
alarmvar_inv_default = 0.3;





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
	
	
	var atk = distance_to_object(obj_player) <= atk_dist;
	if (atk && !attacked) {
		
		//start the atk movement to try to hit the player
		start_atk();
		exit;
		
	}
	
	
	if (health_current <= 0) {
	
		die();
	
	}


	#region movement

	
	var pos = y > obj_player.y;
	
	var dir = directions[pos];
	
	var spd = mve_speed * global.dt_steady;
	
	
	//if the player is at the same pos as the enemy(more or less), it will stay in place
	if (!(y < obj_player.y + 5 && y > obj_player.y - 5)) {
	
		mve_simple(spd, dir);
		
		//correct the direction the enemy is facing
		if (x <= obj_player.x) {
			
			image_xscale = 1;
			
		}
		else {
			
			image_xscale = -1;
			
		}
		
	}
	
	
#endregion

	if (alarmvar_inv <= 0) {
	
		invincible = false;

	}
	if (alarmvar_atk <= 0) {
	
		attacked = false;

	}

	alarmvar_mve -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;
	alarmvar_atk -= global.dt_steady;

	mve_state = moving;
	
}



movement_recoil = function() {
	
	var spd = mve_speed * global.dt_steady;
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

movement_atk = function() {
	
	var dir = mve_dir;
	var spd = mve_speed * global.dt_steady;
	
	mve_simple(spd, dir);
	
	
	var this_hit = check_dmg();
	if (this_hit) {
		
		//start recoil reaction
		start_recoil(true);
		exit;
		
	}
	
	
	if (alarmvar_mve <= 0) {
		
		stop_atk();
		
	}
	
	if (alarmvar_inv <= 0) {
		
		invincible = false;
		
	}
	
	
	alarmvar_mve -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;
	
}



start_recoil = function(inv) {
	
		
	mve_dir = point_direction(obj_player.x, obj_player.y, x, y);
	mve_speed = mve_speed_recoil_recv;
	moving = true;
	alarmvar_mve = recoil_time_default;
	
	mve_state = 2;
	
	if (inv) {
		
		if (global.combo < 3) {
				
			global.combo += 1;
				
		}
		
	
		alarmvar_inv = alarmvar_inv_default;
		invincible = true;
	
	}
	
	
}

start_atk = function() {
	
	mve_dir = point_direction(x, y, obj_player.x, obj_player.y);;
	mve_speed = mve_speed_atk;
	
	moving = true;
	attacked = true;
	invincible = true;
	
	mve_state = 3;
	
	alarmvar_mve = atk_length_default;
	alarmvar_inv = atk_length_default - 0.05;
	
}

stop_recoil = function() {
	
	mve_speed = mve_spd_default;
	
	moving = false;
	
	mve_state = 0;
	
}

stop_atk = function() {
	
	mve_speed = mve_spd_default;
	
	moving = false;
	
	mve_state = 0;
	
	alarmvar_atk = 0.5;
	
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

