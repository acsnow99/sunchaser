/// @description initialize variables

#region movement

mve_spd_default = 400;
mve_spd = mve_spd_default;
atk_special_mve_spd_default = 2000;
atk_special_mve_spd = atk_special_mve_spd_default;
atk_special_dist_max_default = 700;
atk_special_dist_max = atk_special_dist_max_default;
dir_last = 0;

mve_inputs[0] = ord("D");
mve_inputs[1] = ord("W");
mve_inputs[2] = ord("A");
mve_inputs[3] = ord("S");

//button to activate special attack
atk_input_sp = 	ord("E");
//button to activate normal attack
atk_input_basic = vk_space;

directions[0] = 0;
directions[1] = 90;
directions[2] = 180;
directions[3] = 270;
//the first value indicates direction
//0 is 0, 1 is 90, 2 is 180, 3 is 270
//the second value indicates movement state
//index 0 for second value means idle
//index 1 for second value means moving normally
//index 2 for second value means attacking normally
//index 3 for second value means prepping for a special atk
//index 4 for second value means using a special atk
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
dir_sprites[0, 4] = spr_player_run_lr;
dir_sprites[1, 4] = spr_player_run_up;
dir_sprites[2, 4] = spr_player_run_lr;
dir_sprites[3, 4] = spr_player_run_dwn;

//sequences for the atks(****REMOVE SOON TO REPLACE WITH REGULAR SPRITES ABOVE****)
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
alarmvar_wait = 500000;
atk_length_sp = 0.75;
wait_length_atk_sp = 0.5; 

combo = 0;
combo_max = 1;


enabled = true;

spr_current = spr_player_idle_lr;
current_atk_hb = -1;


movement_input_normal = function (dir, xinput, yinput) {
	
	if (keyboard_check(atk_input_basic)) {
	
		start_atk_basic();
		exit;
	
	}
	
	
	if (keyboard_check(atk_input_sp)) {
		
		start_atk_sp();
		exit;
		
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
	
	alarmvar_wait -= global.dt_steady;
	
	
	if (alarmvar_wait <= 0) {
	
		var spd_exct = mve_spd * global.dt_steady;
		
		alarmvar_mve -= global.dt_steady;
		
		//scr_mve_simple(spd_exct, dir);
	
	
		#region movement(script doesn't work for some reason)
	
		var xtarg = x + lengthdir_x(spd_exct, 0);
		var ytarg = y + lengthdir_y(spd_exct, 0);
		var setx = false;
		var sety = false;


		if !place_meeting(xtarg, y, obj_obstacle_parent) {
		
			x = xtarg;
			setx = true;
	
		}
	
		if !place_meeting(x, ytarg, obj_obstacle_parent) {
		
			y = ytarg;
			sety = true;
		
		}


		if (!setx || !sety) {
			moving = false;
		}
		else {
			moving = true;
		}
	
		#endregion
	
		if (!moving) {
		
			stop_atk_sp();
		
		}

		if (alarmvar_mve <= 0) {
		
			stop_atk_sp();
		
		}
	
	
		spr_current = dir_sprites[dir_last, 4]; 
	
	}
	else {
		
		//set direction of coming special atk based on input(can be changed up till the release of the atk
		for (var i = 0; i < 4; i++;) {
	
			if (keyboard_check(mve_inputs[i])) {
		
				dir_last = directions[i];
		
			}
	
		}
		
		spr_current = dir_sprites[dir_last, 3]; 
		
	}
	
}

//called in movement_input_normal if player is hitting atk button
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

//called in movement_input_normal if player is hitting special atk button
start_atk_sp = function () {
	
	mve_state = 3;
	
	current_atk_hb = instance_create_layer(x, y, "Instances", obj_hb_player_atk_special);
	
	spr_current = dir_sprites[dir_last, mve_state];
	mve_spd = atk_special_mve_spd;
	
	alarmvar_mve = atk_length_sp;
	alarmvar_wait = wait_length_atk_sp;
	
}

stop_atk_sp = function () {
	
	mve_state = 0;
	
	instance_destroy(current_atk_hb);
	
	mve_spd = mve_spd_default;
	
	alarmvar_mve = 50000;
	alarmvar_wait = 50000;
	
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

