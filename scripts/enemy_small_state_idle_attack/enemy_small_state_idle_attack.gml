if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
}

sprite_index = idle_animations[0];

if (state_timer >= irandom_range(30,180)) state_switch("Attack");

if (distance_to_object(obj_player) > m_attack_range) state_switch("Follow");
