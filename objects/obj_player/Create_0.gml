/// @description initialize variables

#region movement

mve_spd_default = 400;
mve_spd = mve_spd_default;
dir_last = 0;

mve_inputs[0] = ord("D");
mve_inputs[1] = ord("W");
mve_inputs[2] = ord("A");
mve_inputs[3] = ord("S");
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

//button to activate normal attack
mve_attack = vk_space;

combo = 0;
combo_max = 1

enabled = true;

spr_current = spr_player_idle_lr;

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

