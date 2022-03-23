

atk_damage = 1;

mve_dir = 0;
mve_spd_default = 200;
mve_spd = 0;

sprite_current = spr_projectile_squeed;
frame = 0;

anim_end = 5;
anim_begin = 4;

alarmvar_anim_default = 0.15;
alarmvar_frame_end = alarmvar_anim_default;

alarmvar_shoot = alarmvar_anim_default * anim_end;
alarmvar_destroy = 3;


die = function() {
	
	instance_destroy(self);
	
}
