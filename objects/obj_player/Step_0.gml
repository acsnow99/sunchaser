/// @description movement/detect player input

//check if an animation is active to possibly terminate it
chk_animat();
//check if the player is in an attack or other movement that prohibits use of normal movement
if (!enabled) exit;

var dir = 0;
var xinput = 0;
var yinput = 0;

for (var i = 0; i < 4; i++;) {
	
	if (keyboard_check(mve_inputs[i])) {
		
		dir = directions[i];
		xinput += lengthdir_x(1, dir);
		yinput += lengthdir_y(1, dir);
		
	}
	
	
	
}

moving = (point_distance(0, 0, xinput, yinput) > 0);

if moving {
	
	var dir_exct = point_direction(0, 0, xinput, yinput);
	//value of variable 'moving' may change in the process of this script
	//if the player can't move in the desired direction, moving will change to false
	mve_simple(mve_spd, dir_exct);
	
	//check what direction the player is going to set the direction of the sprites
	if ((dir_exct >= 0 && dir_exct < 90) || dir_exct >= 270 ) {
		image_xscale = 1;
	}
	else if (dir_exct >= 90 && dir_exct < 270) {
		image_xscale = -1;
	}
	
	/*for (i = 0; i < 4; i++;) {
		
		var mve_state = moving;
		var _d = directions[i];
		
		if (_d == 0) {
			var _d_upper = _d + 45;
			var _d_lower = _d + 360 - 45;
		}
		else {
			var _d_upper = _d + 45;
			var _d_lower = _d - 45;
		}
		
		
	}*/
	
	//true/1 for running, false/0 for idle
	var mve_state = moving;
	
	if (x > xprevious) {
		spr_current = dir_sprites[0, mve_state]; 
		dir_last = 0;
	}
	else if (x < xprevious) {
		spr_current = dir_sprites[2, mve_state]; 
		dir_last = 2;
	}
		
	if (y > yprevious) {
		spr_current = dir_sprites[3, mve_state]; 
		dir_last = 3;
	}
	else if (y < yprevious) {
		spr_current = dir_sprites[1, mve_state]; 
		dir_last = 1;
	}
	
}
else {
	spr_current = dir_sprites[dir_last, 0]; 
}


if (keyboard_check(mve_attack)) {
	start_animat(dir_sq[dir_last]);
}

