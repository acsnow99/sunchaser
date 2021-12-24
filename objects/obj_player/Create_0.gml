/// @description initialize variables

#region movement

mve_spd_default = 400;
mve_spd = mve_spd_default;
atk_special_mve_spd_default = 1600;
atk_special_mve_spd = atk_special_mve_spd_default;
atk_special_dist_max_default = 700;
atk_special_dist_max = atk_special_dist_max_default;
dir_last = 0;

mve_inputs[0] = ord("D");
mve_inputs[1] = ord("W");
mve_inputs[2] = ord("A");
mve_inputs[3] = ord("S");

atk_input_sp = 	ord("E");

directions[0] = 0;
directions[1] = 90;
directions[2] = 180;
directions[3] = 270;
dir_sprites[0, 0] = spr_player_idle_lr;
dir_sprites[1, 0] = spr_player_idle_up;
dir_sprites[2, 0] = spr_player_idle_lr;
dir_sprites[3, 0] = spr_player_idle_dwn;
dir_sprites[0, 1] = spr_player_run_lr;
dir_sprites[1, 1] = spr_player_run_up;
dir_sprites[2, 1] = spr_player_run_lr;
dir_sprites[3, 1] = spr_player_run_dwn;
dir_sprites[0, 2] = spr_player_run_lr;
dir_sprites[1, 2] = spr_player_run_up;
dir_sprites[2, 2] = spr_player_run_lr;
dir_sprites[3, 2] = spr_player_run_dwn;
dir_sprites[0, 3] = spr_player_run_lr;
dir_sprites[1, 3] = spr_player_run_up;
dir_sprites[2, 3] = spr_player_run_lr;
dir_sprites[3, 3] = spr_player_run_dwn;
//second value of this matrix should never exceed var combo_max below
dir_atk_sq[0, 0] = sq_player_atk_basic_lr;
dir_atk_sq[1, 0] = sq_player_atk_basic_up;
dir_atk_sq[2, 0] = sq_player_atk_basic_lr;
dir_atk_sq[3, 0] = sq_player_atk_basic_dwn;
dir_atk_sq[0, 1] = sq_player_atk_basic_lr;
dir_atk_sq[1, 1] = sq_player_atk_basic_up;
dir_atk_sq[2, 1] = sq_player_atk_basic_lr;
dir_atk_sq[3, 1] = sq_player_atk_basic_dwn;

moving = false;
mve_state = 0;

alarmvar_mve = 500000;

//button to activate normal attack
mve_attack = vk_space;

combo = 0;
combo_max = 1;


enabled = true;

spr_current = spr_player_idle_lr;
current_atk_hb = -1;


movement_input_normal = function (dir, xinput, yinput) {
	
	if (keyboard_check(mve_attack)) {
	
		start_atk_basic();
	
	}
	
	
	if (keyboard_check(atk_input_sp)) {
		
		start_atk_sp();
		
	}
	

	
	for (var i = 0; i < 4; i++;) {
	
		if (keyboard_check(mve_inputs[i])) {
		
			dir = directions[i];
			xinput += lengthdir_x(1, dir);
			yinput += lengthdir_y(1, dir);
		
		}
	
	
	
	}

	moving = (point_distance(0, 0, xinput, yinput) > 0);

	if moving {
	
		var spd_exct = mve_spd * global.dt_steady;
		var dir_exct = point_direction(0, 0, xinput, yinput);
		//value of variable 'moving' may change in the process of this script
		//if the player can't move in the desired direction, moving will change to false
		mve_simple(spd_exct, dir_exct);
	
		/*check what direction the player is going to set the direction of the sprites
		(now below in the "sprite change" region
		if ((dir_exct >= 0 && dir_exct < 90) || dir_exct >= 270 ) {
			image_xscale = 1;
		}
		else if (dir_exct >= 90 && dir_exct < 270) {
			image_xscale = -1;
		}*/
	
		/*for (i = 0; i < 4; i++;) {
		
			var mve_state = moving;
			var _d = directions[i];
		
			if (_d == 0) {
				var _d_upper = _d + 45;
				var _d_lower = _d + 360 - 45;
			}
			else {
				var _d_upper = _d + 45;
				var _d_lower = _d - 45;
			}
		
		
		}*/
	
		//true/1 for running, false/0 for idle
		mve_state = moving;
	
		//sprite change
		determine_sprite(mve_state);
	
	}
	else {
		spr_current = dir_sprites[dir_last, 0]; 
	}
	
}


movement_input_atk_sp = function() {
	
	var spd_exct = mve_spd * global.dt_steady;
	
	alarmvar_mve -= global.dt_steady;
	
	scr_mve_simple(spd_exct, 0);
	
	if (!moving) {
		
		stop_atk_sp();
		
	}

	if (alarmvar_mve <= 0) {
		
		stop_atk_sp();
		
	}
	
}

start_atk_basic = function () {
	
	start_animat(dir_atk_sq[dir_last, combo]);
	
	//combo sytem
	if (combo < combo_max) {
		combo += 1;
	}
	else {
		combo = 0;
	}

}

start_atk_sp = function () {
	
	mve_state = 3;
	
	current_atk_hb = instance_create_layer(x, y, "Instances", obj_hb_player_atk_special);
	
	spr_current = dir_sprites[dir_last, mve_state];
	mve_spd = atk_special_mve_spd;
	
	alarmvar_mve = 2;
	
}

stop_atk_sp = function () {
	
	mve_state = 0;
	
	instance_destroy(current_atk_hb);
	
	mve_spd = mve_spd_default;
	
	alarmvar_mve = 50000;
	
}


enable = function () {
	enabled = true;
	image_alpha = 1;
	mve_spd = mve_spd_default;
}

disable = function () {
	enabled = false;
	mve_spd = 0;
}


#endregion


#region animations
active_animat = -1;
sequence_layer = -1;
active_sequence = -1;

start_animat = function (_sequence) {
	active_animat = _sequence;
	sequence_layer = layer_create(depth);
	active_sequence = layer_sequence_create(sequence_layer, x, y, _sequence);
	layer_sequence_xscale(active_sequence, image_xscale);
	
	disable();
}

chk_animat = function () {
	if (active_sequence == -1) return;
	
	if (layer_sequence_is_finished(active_sequence)) {
		layer_sequence_destroy(active_sequence);
		layer_destroy(sequence_layer);
		
		active_animat = -1;
		active_sequence = -1;
		sequence_layer = -1;
		
		combo = 0;
		
		enable();
	}
}

#endregion

