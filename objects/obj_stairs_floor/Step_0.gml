
if (distance_to_object(obj_player) <= dist_interact) {
	
	room_goto(_room);
	
	x = -64;
	y = -64;
	
	obj_player.x = _x;
	obj_player.y = _y;
	
}

if (room != _room) {
	
	x = origin_x;
	y = origin_y;
	
}

