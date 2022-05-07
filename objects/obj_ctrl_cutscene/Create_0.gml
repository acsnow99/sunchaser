
global.cutscene_moment = -1;
global.cutscene_current = -1;

//exclusive, eg 2 = 3 cutscenes
global.cutscene_count = 2;

acting = false;


cutscene_init = function() {
	
	for (var i = 0; i <= global.cutscene_count; i++) {
		
		global.cutscene_acts[i, 0] = obj_actor_parent.start_movement;
		global.cutscene_acts[i, 1] = -1;
		
		global.cutscene_obj[i, 0] = obj_actor_player;
		global.cutscene_obj[i, 1] = -1;
		
		global.cutscene_vars[i, 0] = p_cutscene_0_0;
		global.cutscene_vars[i, 1] = -1;
	
	}
	
	instance_destroy(obj_actor_parent);

}


cutscene_start = function(scene, act) {
	
	global.cutscene_current = scene;
	global.cutscene_moment = act;
	
	
	for (var i = 0; global.cutscene_obj[scene, i] != -1; i++) {
	
		var obj = global.cutscene_obj[scene, i];
		
		if (!instance_exists(obj)) {
			
			var path = global.cutscene_vars[scene, i];
			var _x = path_get_point_x(path, 0);
			var _y = path_get_point_y(path, 0);
		
			instance_create_layer(_x, _y, "Instances", obj);
			
		}
		
	}
	
	instance_deactivate_all(true);
	instance_activate_object(obj_cutscene_trigg_parent);
	instance_activate_object(obj_obstacle_parent);
	instance_activate_object(obj_actor_parent);
	
	acting = true;
	
}


cutscene = function() {
	
	var act = global.cutscene_acts[global.cutscene_current, global.cutscene_moment];
	var vars = global.cutscene_vars[global.cutscene_current, global.cutscene_moment];
	
	if (act == -1) {
		
		cutscene_end();
		exit;
		
	}
	
	act(vars);
	
}


cutscene_end = function() {
	
	instance_activate_all();
	acting = false;
	
}


