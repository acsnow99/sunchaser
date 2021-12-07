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


	//old collision code: "not place_meeting(xtarg, ytarg, obj_wall_parent)"
	
	x = xtarg;
	setx = true;
	
	y = ytarg;
	sety = true;


	if (!setx || !sety) {
		moving = false;
	}

}