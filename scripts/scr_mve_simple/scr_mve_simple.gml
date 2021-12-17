// @function mve_simple(_spd, _dir)
// @param {real} _spd
// @param {real} _dir


function mve_simple(_spd, _dir){

	#region from online(supposed to fix graphical jitter effect)
	//result: does the same thing as rounding draw event vars
	/*
	hr += length_dir_x(_spd, _dir);
	vr += length_dir_y(_spd, _dir);

	var h = floor(hr), v = floor(vr);

	hr -= h;
	vr -= v;
	*/
	#endregion

	var xtarg = x + lengthdir_x(_spd, _dir);
	var ytarg = y + lengthdir_y(_spd, _dir);
	var setx = false;
	var sety = false;


	if !place_meeting(xtarg, y, obj_obstacle_parent) {
		
		x = xtarg;
		setx = true;
	
	}
	
	if !place_meeting(x, ytarg, obj_obstacle_parent) {
		
		y = ytarg;
		sety = true;
		
	}


	if (!setx || !sety) {
		moving = false;
	}

}