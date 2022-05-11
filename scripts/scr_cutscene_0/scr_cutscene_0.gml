// @function cutscene(_scene, _act)
// @param {real} _scene
// @param {real} _act


function cutscene(_scene, _act){
	
	if (_act == -1) {
		
		cutscene_end();
		
	}
	
	switch _scene {
		
		case 0:
			
			switch _act {
				
				case 0:
					with (obj_actor_player) {
						
						start_movement(p_cutscene_0_0);
						
					}
					break;
				
			}
			break;
		
	}

}