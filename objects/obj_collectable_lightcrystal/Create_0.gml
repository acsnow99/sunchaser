
value = 1;

animation_pos = 0;
anim_end = 1;
anim_begin = 0;
alarmvar_frame_default = 0.075;
alarmvar_anim = alarmvar_frame_default;

depth = -y;



collect = function() {
	
	global.currency += value;
	
	instance_destroy(self);
	
}
