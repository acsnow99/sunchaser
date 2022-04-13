

health_current = 10;
health_last = health_current;

atk_damage = 10;

mve_dir = 0;
mve_spd_default = 250;
mve_spd = 0;
mve_state = 0;

sprite_current = spr_projectile_squeed;
frame = 0;

anim_end = 3;
anim_begin = 2;

alarmvar_anim_default = 0.20;
alarmvar_frame_end = alarmvar_anim_default;

alarmvar_shoot = alarmvar_anim_default * anim_end;
alarmvar_destroy = 3;

squeed = -1;


movement_charge = function() {
	
	if (place_meeting(x, y, obj_player)) {
	
		die();
	
	}
	
	if (alarmvar_shoot <= 0) {
	
		start_movement_shoot();
	
	}
	
	
	x = squeed.x;
	y = squeed.y;
	

	alarmvar_shoot -= global.dt_steady;
	
}


movement_shoot = function() {
	
	
	if (place_meeting(x, y, obj_player) || distance_to_object(obj_obstacle_parent) <= 64) {
	
		die();
	
	}
	
	if (alarmvar_destroy <= 0) {
		
		die();
		
	}
	
	
	mve_dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	var spd = mve_spd * global.dt_steady;
	mve_simple(spd, mve_dir);
	
	
	alarmvar_destroy -= global.dt_steady;
	
}

start_movement_shoot = function() {

	mve_spd = mve_spd_default;
	
	mve_state = 1;
	
}


die = function() {
	
	instance_destroy(self);
	
}
