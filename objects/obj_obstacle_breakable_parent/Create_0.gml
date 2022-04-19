
depth = -y;

animation_length_current = 1;
animation_pos = 0;

sprite_current = spr_obstacle_bush;


atk_vuln[0] = true;
atk_vuln[1] = true;
atk_vuln[2] = true;



die = function(atk) {

	instance_create_layer(x, y, "fx", global.fx_destroy[atk]);
	
	instance_destroy();
	
}

