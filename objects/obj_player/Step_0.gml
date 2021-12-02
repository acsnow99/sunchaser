/// @description movement/detect player input


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
	//value of variable 'moving' changes in the process of this script
	mve_simple(mve_spd, dir_exct);
	
}