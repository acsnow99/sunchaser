/// @description enemy attributes. Health, speed, etc.

health_max = 60;
health_current = health_max;
health_last = health_current;

atk_damage = 10;

invincible = false;

spr_current = spr_squeed;

animation_pos = 0;
animation_length_current = 2;

image_xscale_default = image_xscale;

moving = false;
mve_state = 0;
mve_spd_default = 40;
mve_speed_inc = 4;
mve_spd_pause_default = 40;
mve_speed = 40;
mve_speed_recoil_recv = 200;
mve_dir = 270;
dir_last = 0;
projectile = -1;
//how long until assigning new movement pattern
alarmvar_mve_default = 0.5;
alarmvar_mve_pause_default = 1;
alarmvar_mve = alarmvar_mve_default;
alarmvar_speed_inc_default = 0.8;
alarmvar_speed_inc = alarmvar_speed_inc_default;
alarmvar_opt = 0;
alarmvar_inv = 0;
alarmvar_ghost_frame = 0;
alarmvar_ghost_frame_default = 0.1;
alarmvar_projectile_default = 4;
alarmvar_projectile = 0;
recoil_time_default = 0.15;
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
	
	
	if (health_current <= 0) {
	
		die(true);
	
	}
	
	
	if (alarmvar_projectile <= 0) {
		
		projectile = instance_create_layer(x, y, "fx", obj_projectile_squeed);
		projectile.squeed = self;
		alarmvar_projectile = alarmvar_projectile_default;
		
	}


	#region movement
	
	
	if (alarmvar_mve <= 0) {
		
		start_movement_pause();
		
	}



	if (alarmvar_speed_inc <= 0) {
			
		mve_speed += mve_speed_inc;
		
		alarmvar_speed_inc = alarmvar_speed_inc_default;
		
	}
	

	var spd = mve_speed * global.dt_steady;
	mve_simple(spd, mve_dir);
	
	
	
	#endregion	

	alarmvar_mve -= global.dt_steady;
	alarmvar_speed_inc -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;
	alarmvar_projectile -= global.dt_steady;
	
}


movement_pause = function() {
	
	
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
	
		die(true);
	
	}
	
	
	if (alarmvar_projectile <= 0) {
		
		projectile = instance_create_layer(x, y, "Instances", obj_projectile_squeed);
		projectile.squeed = self;
		alarmvar_projectile = alarmvar_projectile_default;
		
	}


	#region movement
	
	
	if (alarmvar_mve <= 0) {
		
		start_movement_normal();
		
	}



	var spd = mve_speed * global.dt_steady;
	mve_simple(spd, mve_dir);
	
	
	
	#endregion

	alarmvar_mve -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;
	alarmvar_projectile -= global.dt_steady;
	
}



movement_recoil = function() {
	
	var spd = mve_speed * global.dt_steady;
	var dir = mve_dir;
	
	mve_simple(spd, dir);
	check_dmg();
	
	if (alarmvar_mve <= 0) {
		
		stop_recoil();
		
	}
	//Now checked in check_dmg();
	/* 
	if (alarmvar_inv <= 0) {
		
		invincible = false;
		
	}*/
	
	alarmvar_mve -= global.dt_steady;
	alarmvar_inv -= global.dt_steady;
	
}


start_movement_normal = function() {
	
	mve_state = 1;
	
	mve_speed = mve_spd_default;
	mve_dir = irandom_range(70, 110);
	
	alarmvar_speed_inc = alarmvar_speed_inc_default;
	alarmvar_mve = alarmvar_mve_default;
	
}


start_movement_pause = function() {
	
	mve_state = 0;
	
	mve_speed = mve_spd_pause_default;
	mve_dir = irandom_range(250, 290);
			
	alarmvar_mve = alarmvar_mve_pause_default;
	
}




start_recoil = function(inv) {
	
		
	mve_dir = point_direction(obj_player.x, obj_player.y, x, y);
	mve_speed = mve_speed_recoil_recv;
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
	
	mve_speed = mve_spd_default;
	mve_dir = 90;
	
	mve_state = 0;
	
}



check_dmg = function() {
	
	
	if (alarmvar_inv <= 0) {
		
		invincible = false;
		
	}
	

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


die = function(drop) {
	
	if (drop) {
		
		var i = irandom_range(0, 1);

		if (i) {
	
			instance_create_layer(x, y, "Instances", obj_collectable_lightcrystal);
	
		}
		
	}
	
	
	instance_destroy(self);
	
}

