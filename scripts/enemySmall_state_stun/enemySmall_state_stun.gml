if(state_new) {
	image_index = 0;
	image_speed = 0;
	
	var _point_to_player = vector((obj_player.x - x),(obj_player.y - y));
	velocity = vector_scaler(_point_to_player, -1.5);
}

if (state_timer > 10) { image_speed = default_image_speed; state_switch_previous(); }
