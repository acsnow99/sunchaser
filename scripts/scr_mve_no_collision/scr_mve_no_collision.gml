// @function mve_simple(_spd, _dir)
// @param {real} _spd
// @param {real} _dir


function mve_no_collision(_spd, _dir){


	var xtarg = round(x + lengthdir_x(_spd, _dir));
	var ytarg = round(y + lengthdir_y(_spd, _dir));


	x = xtarg;
	y = ytarg;


}