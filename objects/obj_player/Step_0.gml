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
	
}


if (keyboard_check(mve_attack)) {

	start_animat(sq_atk_basic);

}

