if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
}

sprite_index = idle_animations[0];
if (state_timer >= irandom_range(room_speed*2,room_speed*25)) state_switch_previous();