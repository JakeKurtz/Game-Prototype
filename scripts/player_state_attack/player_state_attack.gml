
if(state_new) {
    image_index = 0;
	if sword sprite_index = animations_attack[0];
}

//WASD_enabled = false;
if (sword) {
	if (key_attack) {
		if (combo == 0) {
			image_index = 0; 
			sprite_index = animations_attack[1];
			x_speed += (5 * image_xscale/image_scale) * walk_accel;
		} 
		else if (combo == 1) {
			image_index = 0; 
			sprite_index = animations_attack[2]; 
			x_speed += (5 * image_xscale/image_scale) * walk_accel;
		}
	
		alarm[0] = room_speed/2;
		combo += 1;
	}

	// controls acceleration caused by attack
	x_speed = clamp(x_speed,-dash_max,dash_max);
	y_speed = clamp(y_speed,-dash_max,dash_max);

	// spawn hitbox
	if		(hitbox == -1 && sprite_index == animations_attack[0] && floor(image_index) == 2) hitbox = hitbox_create(20*sign(image_xscale), 15, 0, -8, 15, 3, 45);
	else if (hitbox == -1 && sprite_index == animations_attack[1] && floor(image_index) == 1) hitbox = hitbox_create(20*sign(image_xscale), 15, 0, -8, 15, 3, 45);
	else if (hitbox == -1 && sprite_index == animations_attack[2] && floor(image_index) == 2) hitbox = hitbox_create(20*sign(image_xscale), 15, 0, -8, 15, 3, 45);

	if (image_index+image_speed >= 6) state_switch("Idle");
}

else if (bomb) {
	// **************************** BOMB SHIT ***********************************
	sprite_index = spr_player_idle;
	if mouse_check_button_released(mb_left) {
		throw_bomb(x,y,mouse_x,mouse_y,foo);
		state_switch("Idle");
	}
	// **************************************************************************
}