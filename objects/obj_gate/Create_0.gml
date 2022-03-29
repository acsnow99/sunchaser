
open = false;


//how far away the player needs to be to be able to open the door
open_dist = 32;

_x = x;
_y = y;

spr_current = spr_gate;

anim_begin = 3;
anim_end = 3;
frame = 0;

alarmvar_anim_default = 0.30;
alarmvar_frame_end = alarmvar_anim_default;



act_open = function() {
	
	open = true;

	//moves off screen permanently, but still draws at original location
	x = -64;
	y = -64;
	
	
}
