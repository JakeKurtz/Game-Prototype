// Not sure if I'm going to use this state.

if(state_new) {
	if (obj_player.facing == 1 || obj_player.facing == 2) {
		velocity[1] = 0.2*obj_player.x_speed;
		velocity[2] = 0.2*obj_player.y_speed+random_range(-4,4);
	}
	if (obj_player.facing == 0 || obj_player.facing == 3) {
		velocity[1] = 0.2*obj_player.x_speed+random_range(-4,4);
		velocity[2] = 0.2*obj_player.y_speed;
	}
	image_index = 0;
}

// Decelerate movement
if (velocity[1] != 0) velocity[1] -= (0.1 * sign(velocity[1]))
if (velocity[2] != 0) velocity[2] -= (0.1 * sign(velocity[2]))

if (velocity[1] <= 0 && velocity[2] <= 0) state_switch_previous();
