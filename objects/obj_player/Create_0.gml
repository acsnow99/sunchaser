/// @description initialize variables

#region movement

mve_spd_default = 4;
mve_spd = mve_spd_default;

mve_inputs[0] = ord("D");
mve_inputs[1] = ord("W");
mve_inputs[2] = ord("A");
mve_inputs[3] = ord("S");
directions[0] = 0;
directions[1] = 90;
directions[2] = 180;
directions[3] = 270;
current_direction = 0;
moving = false;

mve_attack = ord("E");

enabled = true;

enable = function () {
	enabled = true;
	image_alpha = 1;
	mve_spd = mve_spd_default;
}

disable = function () {
	enabled = false;
	alarm[0] = 1;
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
		
		enable();
	}
}

#endregion

