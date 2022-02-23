
image_yscale = room_height / sprite_height;

animation_length_current = 1;
animation_pos = 0;

sprite_current = spr_obstacle_rock_1;


//destroys enemies that are in da way
for (var i = 0; i < instance_number(obj_enemy_parent); i++) {
	
	var _this = instance_find(obj_enemy_parent, i);
	if (place_meeting(x, y, _this)) {
	
		instance_destroy(_this);
	
	}
	
}

