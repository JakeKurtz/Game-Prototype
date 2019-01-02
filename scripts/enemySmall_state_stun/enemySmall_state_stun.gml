if(state_new) {
	image_index = 0;
	image_speed = 0;
	_health -= 50;
	var _point_to_player = vector((obj_player.x - x),(obj_player.y - y));
	velocity = vector_scaler(_point_to_player, -3);
}

part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x, x, y+1, y+1, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood, 1);

if (state_timer > 5) { image_speed = default_image_speed; state_switch_previous(); }
