if(state_new) {
	if (obj_Player.facing == 1 || obj_Player.facing == 2) {
		velocity[1] = 0.2*obj_Player.x_speed;
		velocity[2] = 0.2*obj_Player.y_speed+random_range(-4,4);
	}
	if (obj_Player.facing == 0 || obj_Player.facing == 3) {
		velocity[1] = 0.2*obj_Player.x_speed+random_range(-4,4);
		velocity[2] = 0.2*obj_Player.y_speed;
	}
	image_index = 0;
	image_speed = 0;
}

// Decelerating movement
if (velocity[1] != 0) velocity[1] -= (0.1 * sign(velocity[1]))
if (velocity[2] != 0) velocity[2] -= (0.1 * sign(velocity[2]))

if (velocity[1] <= 0 && velocity[2] <= 0) state_switch_previous();
