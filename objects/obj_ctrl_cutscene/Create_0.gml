
global.cutscene_moment = -1;
global.cutscene_current = -1;

//exclusive, eg 2 = 3 cutscenes
cutscene_count = 2;

acting = false;


cutscene_init = function() {
	
	for (var i = 0; i <= global.cutscene_count; i++) {

		global.cutscene_acts[i, 0] = obj_actor_parent.start_movement;
		global.cutscene_acts[i, 1] = -1;
		
		global.cutscene_obj[i, 0] = obj_player;
		global.cutscene_obj[i, 1] = -1;
		
		global.cutscene_vars[i, 0] = p_cutscene_0_0;
		global.cutscene_vars[i, 1] = -1;
	
	}

}


cutscene_start = function(scene, act) {
	
	global.cutscene_current = scene;
	global.cutscene_moment = act;
	
	for (var i = 0; global.cutscene_obj[scene, i] != -1; i++) {
	
		var obj = global.cutscene_obj[scene, i];
		var obj_a = obj.actor;
		var _x = obj.x;
		var _y = obj.y;
		
		instance_deactivate_object(obj);
	
		instance_create_layer(_x, _y, "Instances", obj_a);
		
	}
	
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
	
	acting = false;
	
}


