
global.cutscene_moment = -1;
global.cutscene_current = -1;

//exclusive, eg 2 = 3 cutscenes
cutscene_count = 2;

acting = false;


cutscene_init = function() {
	
	for (var i = 0; i <= global.cutscene_count; i++) {
	
		global.cutscene_acts[i, 0] = obj_actor_parent.start_movement;
	
	}

}


cutscene_start = function(scene, act) {
	
	global.cutscene_current = scene;
	global.cutscene_moment = act;
	
	acting = true;
	
}

cutscene = function() {
	
	global.cutscene_acts[global.cutscene_current, global.cutscene_moment](0, 0, 0);
	
}


