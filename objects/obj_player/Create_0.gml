/// @description initialize variables

#region movement


//dir_last indicates direction
//0 is 0, 1 is 90, 2 is 180, 3 is 270
//mve_state indicates movement state
//index 0 for second value means idle
//index 1 for second value means moving normally
//index 2 for second value means attacking normally
//index 3 for second value means using a special atk
//index 4 for second value means prepping for a special atk
//index 5 for second value means recoil from incoming damage


mve_spd_default = 500;
mve_spd = mve_spd_default;
mve_spd_atk_basic_default = 300;
atk_special_mve_spd_default = 2000;
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


//animation length
animation_length_current = 1;
animation_pos = 0;

//number of colors in the sprite pallete(including 0 as a number)
colors_count = 3;


image_xscale_default = image_xscale;

draw_color = c_white;
draw_color_dmg = c_purple;


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
atk_length_lantern = 0.3;
atk_length_sp = 0.75;
wait_length_atk_sp = 0.5; 


enem_closest = -1;
enem_closest_x = 0;
enem_closest_y = 0;

combo = 0;
combo_max = 1;

//to check if a sp atk has started yet
energy_used = false;
attacking = false;

invincible = false;

//to check if a basic atk has landed
atk_landed = false;

//keeps track of buttons pressed 
// 0 is for basic atk button
// 1 is for sp atk button
pressed[0] = false;
pressed[1] = false;

spr_current = spr_player_complete;
hb_atk_current = -1;


//how big the hb(hitbox) for the basic atk is relative to its normal size(1 for normal size)
hb_atk_basic_xscale = 1;
hb_atk_basic_yscale = 1;
hb_atk_lantern_xscale = 1;
hb_atk_lantern_yscale = 1;


#region movement input functions, movement, and step checks(called in step event or from each other)

movement_input_normal = function (dir, xinput, yinput) {
	
	if (keyboard_check_pressed(atk_input_basic)) {
	
		if (global.item_equipped == 1) {
			
			start_atk_basic();
			exit;
			
		}
		
		if (global.item_equipped == 2) {
			
			start_atk_lantern();
			exit;
			
		}
	
	}
	//if they let go of the button, let them attack again
	else if (keyboard_check_released(atk_input_basic)) {
		
		pressed[0] = false;
		
	}
	
	
	if (keyboard_check(atk_input_sp)) {
		
		start_atk_sp();
		exit;
		
	}
	//if they let go of the button, let them attack again
	else if (keyboard_check_released(atk_input_sp)) {
		
		pressed[1] = false;
		
	}
	
	if (!invincible) {
	
		if (alarmvar_inv <= 0) {
		
			make_vincible();
		
		}

		if (place_meeting(x, y, obj_enemy_parent)) {
		
			start_recoil_receiving(true);
			exit;
		
		}
		
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
		//TEMPORARY CLAUSE
		if (global.debug) { spd_exct = spd_exct * 4 }
		var dir_exct = point_direction(0, 0, xinput, yinput);
		//value of variable 'moving' may change in the process of this script
		//if the player can't move in the desired direction, moving will change to false
		mve_simple(spd_exct, dir_exct);
		
		dir_sprite(mve_state, image_xscale);
	
		//true/1 for running, false/0 for idle
		mve_state = 1;
	
	}
	
	
	
	alarmvar_inv -= global.dt_steady;
	
}


movement_input_atk_basic = function() {
	//no input available, moves player slightly forward
	
	alarmvar_mve -= global.dt_steady;
	
	
	var spd_exct = mve_spd * global.dt_steady;
	var dir_exct = directions[dir_last];
	
	if (!atk_landed) {
		
		with(hb_atk_current) {
			
			obj_player.atk_landed = place_meeting(x, y, obj_enemy_parent);
			
		}
		
	}
	else {
		
		spd_exct -= (mve_spd * global.dt_steady) * 1.5;
		
	}
	
	#region movement(calling scr_mve_simple doesn't work for some reason)
	
	var xtarg = round(x + lengthdir_x(spd_exct, dir_exct));
	var ytarg = round(y + lengthdir_y(spd_exct, dir_exct));
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
	
	//if they let go of the button, let them attack again
	if (keyboard_check_released(atk_input_basic)) {
		
		pressed[0] = false;
		
	}
	
	
}

movement_input_atk_sp = function() {
	
	alarmvar_wait -= global.dt_steady;
	
	if (alarmvar_wait <= 0) {
		
		attacking = true;
		
	}
	
	
	if (attacking) {
	
		var spd_exct = mve_spd * global.dt_steady;
		var dir_exct = directions[dir_last];
		
		//special attack uses energy
		if (!energy_used && health > 10) {
			
			health -= 10;
			energy_used = true;
		
		}
		
		
		var _x = x + lengthdir_x(spd_exct, dir_exct);
		var _y = y + lengthdir_y(spd_exct, dir_exct);
		
		if (!instance_exists(obj_hb_player_atk_sp)) {
			
			hb_atk_current = instance_create_layer(_x, _y, "hb", obj_hb_player_atk_sp);
			
			hb_atk_current.image_angle = directions[dir_last];
			
		}
		
		
		alarmvar_mve -= global.dt_steady;
	
	
		#region movement(calling scr_mve_simple doesn't work for some reason)
	
		var xtarg = round(x + lengthdir_x(spd_exct, dir_exct));
		var ytarg = round(y + lengthdir_y(spd_exct, dir_exct));
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
	
	
	}
	else {
		
		//set direction of coming special atk based on input(can be changed up till the release of the atk
		for (var i = 0; i < 4; i++;) {
	
			if (keyboard_check(mve_inputs[i])) {
		
				dir_last = i;
		
			}
	
		}
		
		
	}
	
	
	
	//if they let go of the button, let them attack again
	if (keyboard_check_released(atk_input_sp)) {
		
		pressed[1] = false;
		
	}
	
}

movement_input_recoil_receiving = function() {
	
	
	var spd_exct = mve_spd_recoil_recv * global.dt_steady;
	var dir_exct = point_direction(enem_closest_x, enem_closest_y, x, y + 32);
	//value of variable 'moving' may change in the process of this script
	//if the player can't move in the desired direction, moving will change to false
	mve_simple(spd_exct, dir_exct);
	
	
	if (alarmvar_recoil_recv <= 0) {
		
		mve_state = 0;
		
	}
	
	if (alarmvar_inv <= 0) {
		
		make_vincible();
		
	}
	
		
	alarmvar_inv -= global.dt_steady;
	alarmvar_recoil_recv -= global.dt_steady;
	
}

//called in movement_input_normal if player is hitting atk button
start_atk_basic = function () {
	
	if (!pressed[0]) {
		
		mve_state = 2;
		pressed[0] = true;
	
		image_index = 0;
	
		mve_spd = mve_spd_atk_basic_default;
	
		alarmvar_mve = atk_length_basic;
	
	
	
		var x_rel = x;
		var y_rel = y;
		var atk_dir = dir_last;
		
		
		hb_atk_current = instance_create_layer(x_rel, y_rel, "hb", obj_hb_player_atk_basic);
		
		hb_atk_current.image_angle = directions[atk_dir];
		hb_atk_current.image_xscale = hb_atk_basic_xscale;
		hb_atk_current.image_yscale = hb_atk_basic_yscale;
	
	
		//combo sytem
		if (combo < combo_max) {
			combo += 1;
		}
		else {
			combo = 0;
		}
		
		
	}

}


start_atk_lantern = function() {
	
	
	if (!pressed[0]) {
		
		mve_state = 2;
		pressed[0] = true;
	
		image_index = 0;
	
		mve_spd = 0;
	
		alarmvar_mve = atk_length_lantern;
	
	
	
		var x_rel = x;
		var y_rel = y;
		var atk_dir = dir_last;
		
		
		hb_atk_current = instance_create_layer(x_rel, y_rel, "hb", obj_hb_player_atk_lantern);
		
		hb_atk_current.image_angle = directions[atk_dir];
		hb_atk_current.image_xscale = hb_atk_lantern_xscale;
		hb_atk_current.image_yscale = hb_atk_lantern_yscale;
		
		
	}
	
}

//called in movement_input_normal if player is hitting special atk button
start_atk_sp = function () {
	
	if (!pressed[1]) {
		
		mve_state = 3;
		pressed[1] = true;
	
		mve_spd = atk_special_mve_spd;
	
		alarmvar_mve = atk_length_sp;
		alarmvar_wait = wait_length_atk_sp;
		energy_used = false;
		
	}
	
}

//called in movement_input_normal if player is receiving damage
start_recoil_receiving = function(dmg) {
	
	mve_state = 5;
		
	alarmvar_recoil_recv = alarmvar_recoil_recv_default;
		
	//finds the values of the nearest enemy
	attacker_id(x, y);
	
	if (dmg) {
		
		damage_take(enem_closest.atk_damage);
		
	}
	
}

stop_atk_basic = function() {
	
	mve_state = 0;
	mve_spd = mve_spd_default;
	atk_landed = false;
	
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


damage_take = function(dmg) {
	
	health -= dmg;
	
	alarmvar_inv = alarmvar_inv_default;
	
	draw_color = draw_color_dmg;
	
}

make_vincible = function() {
	
	invincible = false;
	draw_color = c_white;
	
}


dir_sprite = function(mve_state, _xscale) {
	
	if (x > xprevious) {
		dir_last = 0;
	}
	else if (x < xprevious) {
		dir_last = 2;
	}
		
	if (y > yprevious) {
		dir_last = 3;
	}
	else if (y < yprevious) {
		dir_last = 1;
	}
	
}


//updates enem_closest values by detecting the closest object in the enemy parent/child tree
attacker_id = function(_x, _y) {
	
	enem_closest = instance_nearest(_x, _y, obj_enemy_parent);
	enem_closest_x = enem_closest.x;
	enem_closest_y = enem_closest.y + 32;
	
}

#endregion
