if (state_new) {
	velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	image_speed = 1;
	sprite_index = spr_zombie_die;	
}

if (image_index+image_speed >= image_number) instance_destroy();