if(state_new) {
	image_index = 0;
	image_speed = 0;
	_health -= 50;
	var _point_to_player = vector((obj_player.x - x),(obj_player.y - y));
	velocity = vector_scaler(_point_to_player, -3);
	part_type_direction(obj_ps.part_blood2,vector_direction(_point_to_player),vector_direction(_point_to_player),0,0);
	part_type_speed(obj_ps.part_blood2,(vector_len(obj_player.velocity)/3)-1,(vector_len(obj_player.velocity)/3)+1,0,0);
}

	part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-6, x+6, y-3, y+3, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 2);

if (state_timer > 1) { image_speed = default_image_speed; state_switch_previous(); }
