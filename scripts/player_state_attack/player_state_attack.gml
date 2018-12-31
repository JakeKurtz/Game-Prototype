// TODO : After the player has finished the first attack animation, make it so 
//        that the player can inturrupt the sequence and enter the dash or walk states. 
// TODO : Clean this shit up.
// TODO : Also, make a combo system.

if(state_new) {
    image_index = 0;
	sprite_index = animations_attack[0];
}

WASD_enabled = false;

if (image_index >= 1 && image_index <= 4) {
		with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_hitbox)) {
			image_xscale = other.image_xscale;
		}
}

if (key_attack) {
	show_debug_message(string(image_index));
	if (combo == 0 && image_index <= 4) {
		with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_hitbox)) {
			image_xscale = other.image_xscale;
		}
		image_index = 0; 
		sprite_index = animations_attack[1]; 
	} 
	else if (combo == 1 && image_index <= 4) {
		with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_hitbox)) {
			image_xscale = other.image_xscale;
		}
		image_index = 0; 
		sprite_index = animations_attack[2]; 
	}
	alarm[0] = room_speed/2;
	combo += 1;
}

if (image_index+image_speed >= image_number) state_switch("Idle");
