// @description determines sprite based of the object's own matrix of available directional sprites(dir_sprites)
// mve_state determines the second value used to search in the matrix, which determines which sprite set
// the instance will use
// the direction the instance is moving will determine the specific directional sprite from that set
// @function determine_sprite(mve_state)
// @param {real} mve_state

function determine_sprite(mve_state){
	
	if (x > xprevious) {
		spr_current = dir_sprites[0, mve_state]; 
		dir_last = 0;
		image_xscale = 1;
	}
	else if (x < xprevious) {
		spr_current = dir_sprites[2, mve_state]; 
		dir_last = 2;
		image_xscale = -1;
	}
		
	if (y > yprevious) {
		spr_current = dir_sprites[3, mve_state]; 
		dir_last = 3;
	}
	else if (y < yprevious) {
		spr_current = dir_sprites[1, mve_state]; 
		dir_last = 1;
	}
	
}