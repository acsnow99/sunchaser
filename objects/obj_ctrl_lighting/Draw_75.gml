
if (global.item_equipped == 2) {
	
	with (obj_light_player) {
		
		light_intensity = light_intensity_default;
		lit = true;
		
	}
	
}
else {
	
	with (obj_light_player) {
		
		light_intensity = 0;
		lit = false;
		
	}
	
}

light_update();
