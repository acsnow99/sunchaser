/// @description initialize variables

#region movement

mve_spd_default = 400;
mve_spd = mve_spd_default;
mve_spd_atk_basic_default = 250;
atk_special_mve_spd_default = 2500;
atk_special_mve_spd = atk_special_mve_spd_default;
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
//index 3 for second value means using a special atk
//index 4 for second value means prepping for a special atk
//index 5 for second value means recoil from incoming damage
dir_sprites[0, 0] = spr_player_idle_lr;
dir_sprites[1, 0] = spr_player_idle_up;
dir_sprites[2, 0] = spr_player_idle_lr;
dir_sprites[3, 0] = spr_player_idle_dwn;
dir_sprites[0, 1] = spr_player_run_lr;
dir_sprites[1, 1] = spr_player_run_up;
dir_sprites[2, 1] = spr_player_run_lr;
dir_sprites[3, 1] = spr_player_run_dwn;
dir_sprites[0, 2] = spr_player_atk_basic_lr;
dir_sprites[1, 2] = spr_player_atk_basic_up;
dir_sprites[2, 2] = spr_player_atk_basic_lr;
dir_sprites[3, 2] = spr_player_atk_basic_dwn;
dir_sprites[0, 3] = spr_player_run_lr;
dir_sprites[1, 3] = spr_player_run_up;
dir_sprites[2, 3] = spr_player_run_lr;
dir_sprites[3, 3] = spr_player_run_dwn;
dir_sprites[0, 4] = spr_player_run_lr;
dir_sprites[1, 4] = spr_player_run_up;
dir_sprites[2, 4] = spr_player_run_lr;
dir_sprites[3, 4] = spr_player_run_dwn;
dir_sprites[0, 5] = spr_player_run_lr;
dir_sprites[1, 5] = spr_player_run_up;
dir_sprites[2, 5] = spr_player_run_lr;
dir_sprites[3, 5] = spr_player_run_dwn;

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
alarmvar_inv = 0;
alarmvar_recoil_recv = 0;
alarmvar_ghost_frame = 0;
//default invincibility frames
alarmvar_inv_default = 0.25;
alarmvar_recoil_recv_default = 0.075;
alarmvar_ghost_frame_default = 0.1;
mve_spd_recoil_recv = mve_spd_default * 3;
atk_length_basic = 0.2;
atk_length_sp = 0.75;
wait_length_atk_sp = 0.5; 


enem_closest = -1;
enem_closest_x = 0;
enem_closest_y = 0;

combo = 0;
combo_max = 1;

energy_used = false;
attacking = false;


enabled = true;

spr_current = spr_player_idle_lr;
hb_atk_current = -1;


#region movement input functions, movement, and step checks(called in step event or from each other)

movement_input_normal = function (dir, xinput, yinput) {
	
	if (keyboard_check(atk_input_basic)) {
	
		start_atk_basic();
		exit;
	
	}
	
	
	if (keyboard_check(atk_input_sp)) {
		
		start_atk_sp();
		exit;
		
	}


	alarmvar_inv -= global.dt_steady;

	if (place_meeting(x, y, obj_enemy_parent) && alarmvar_inv <= 0) {
		
		start_recoil_receiving();
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
		mve_state = 1;
	
		//sprite change
		determine_sprite(mve_state);
	
	}
	else {
		spr_current = dir_sprites[dir_last, 0]; 
	}
	
}


movement_input_atk_basic = function() {
	//no input available, moves player slightly forward
	
	alarmvar_mve -= global.dt_steady;
	
	
	var spd_exct = mve_spd * global.dt_steady;
	var dir_exct = directions[dir_last];
	
	#region movement(calling scr_mve_simple doesn't work for some reason)
	
	var xtarg = x + lengthdir_x(spd_exct, dir_exct);
	var ytarg = y + lengthdir_y(spd_exct, dir_exct);
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
	
	
	if (alarmvar_mve <= 0) {
		
		stop_atk_basic();
		
	}
	
}

movement_input_atk_sp = function() {
	
	alarmvar_wait -= global.dt_steady;
	
	if (alarmvar_wait <= 0) {
		
		attacking = true;
		
	}
	
	
	if (attacking) {
	
		var spd_exct = mve_spd * global.dt_steady;
		
		//special attack uses energy
		if (!energy_used) {
			
			health -= 10;
			energy_used = true;
		
		}
		
		if (!instance_exists(obj_hb_player_atk_sp)) {
			
			hb_atk_current = instance_create_layer(x, y, "hb", obj_hb_player_atk_sp);
			
		}
		
		
		alarmvar_mve -= global.dt_steady;
	
	
		#region movement(calling scr_mve_simple doesn't work for some reason)
	
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
	
	
		spr_current = dir_sprites[dir_last, 3]; 
	
	}
	else {
		
		//set direction of coming special atk based on input(can be changed up till the release of the atk
		for (var i = 0; i < 4; i++;) {
	
			if (keyboard_check(mve_inputs[i])) {
		
				dir_last = i;
		
			}
	
		}
		
		spr_current = dir_sprites[dir_last, 4];
		
	}
	
}

movement_input_recoil_receiving = function() {
	
	alarmvar_inv -= global.dt_steady;
	alarmvar_recoil_recv -= global.dt_steady;
	
	
	if (alarmvar_recoil_recv > 0) {
		
		var spd_exct = mve_spd_recoil_recv * global.dt_steady;
		var dir_exct = point_direction(enem_closest_x, enem_closest_y, x, y + 32);
		//value of variable 'moving' may change in the process of this script
		//if the player can't move in the desired direction, moving will change to false
		mve_simple(spd_exct, dir_exct);
		
	}
	else {
		
		mve_state = 0;
		
	}
	
}

//called in movement_input_normal if player is hitting atk button
start_atk_basic = function () {
	
	mve_state = 2;
	
	spr_current = dir_sprites[dir_last, 2];
	image_index = 0;
	
	mve_spd = mve_spd_atk_basic_default;
	
	alarmvar_mve = atk_length_basic;
	
	hb_atk_current = instance_create_layer(x, y, "hb", obj_hb_player_atk_basic);
	
	if (dir_last == 0 || dir_last == 2) {
		
		hb_atk_current.x = x + (64 * (1 - dir_last))
		
	}
	else if (dir_last == 1 || dir_last == 3) {
		
		hb_atk_current.y = y + (64 * -(2 - dir_last))
		
	}
	
	
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
	
	spr_current = dir_sprites[dir_last, mve_state];
	mve_spd = atk_special_mve_spd;
	
	alarmvar_mve = atk_length_sp;
	alarmvar_wait = wait_length_atk_sp;
	energy_used = false;
	
}

//called in movement_input_normal if player is receiving damage
start_recoil_receiving = function() {
	
	health -= 10;
	
	mve_state = 5;
		
	alarmvar_recoil_recv = alarmvar_recoil_recv_default;
	alarmvar_inv = alarmvar_inv_default;
		
	//finds the values of the nearest enemy
	attacker_id(x, y);
	
}

stop_atk_basic = function() {
	
	mve_state = 0;
	mve_spd = mve_spd_default;
	spr_current = dir_sprites[dir_last, 0];
	
	instance_destroy(hb_atk_current);
	
}

stop_atk_sp = function () {
	
	mve_state = 0;
	
	mve_spd = mve_spd_default;
	
	alarmvar_mve = global.dt_steady + 50000;
	alarmvar_wait = global.dt_steady + 50000;
	
	instance_destroy(hb_atk_current);
	
	attacking = false;
	
}


#endregion


//updates enem_closest values by detecting the closest object in the enemy parent/child tree
attacker_id = function(_x, _y) {
	
	enem_closest = instance_nearest(_x, _y, obj_enemy_parent);
	enem_closest_x = enem_closest.x;
	enem_closest_y = enem_closest.y + 32;
	
}

#endregion
