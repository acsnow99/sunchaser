//@description camera setup - level bounds

in_level = (room == rm_level);

//object on which to focus the camera
focus_obj = obj_player;
focus_quick = false;

cam_spd_normal = 0.75;
cam_spd_quick = 1;

//the room has just started
room_start = true;




// initiate the level boundaries using the above function
levels_initiated = false;

if (instance_exists(obj_level_frame)) {

	levels_init();
	
}


