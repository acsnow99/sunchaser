
//lighting

light_surface = -1;

light_player = -1;


//level of darkness when there is no light(0-1)
global.default_darkness[0] = 0.05;
global.default_darkness[1] = 0.15;
global.default_darkness[2] = 0.55;
global.ambient_darkness = 0.05;


light_update = function() {
	
	global.ambient_darkness = global.default_darkness[global.sunlight_current];
	
	//light
	if surface_exists(light_surface) {
		surface_set_target(light_surface);

		draw_clear_alpha(c_black, global.ambient_darkness);


		if (object_exists(obj_light_parent)) {
	
	
			//draw a circle of light around every light
			draw_set_color(c_white);
	
			for (var i = 0; i < instance_number(obj_light_parent); i += 1) {
				
				var light_obj = instance_find(obj_light_parent, i);
				
				if (light_obj.lit) {
					
					//subtract the shape of the light from global.ambient_darkness
					gpu_set_blendmode(bm_subtract);
			
					draw_sprite_ext(light_obj.light_shape_sprite, light_obj.image_index, light_obj.x - camera_get_view_x(view), light_obj.y - camera_get_view_y(view), light_obj.xscale, light_obj.yscale, light_obj.rotation, c_white, light_obj.light_intensity);
				
				
					//draw the shape of the light with the correct 
					// color to add a tint to the area of the light
					gpu_set_blendmode(bm_normal);
				
					draw_sprite_ext(light_obj.light_shape_sprite, light_obj.image_index, light_obj.x - camera_get_view_x(view), light_obj.y - camera_get_view_y(view), light_obj.xscale, light_obj.yscale, light_obj.rotation, light_obj.color, light_obj.light_color_alpha);
				
				}
				
			}
		}
	
		surface_reset_target();
	
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
		draw_surface(light_surface, 0, 0);


	}
	else {
	
		light_surface = surface_create(global.view_width*global.window_scale, global.view_height*global.window_scale);

	}
	
}


item_check = function() {
	
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
	
}
