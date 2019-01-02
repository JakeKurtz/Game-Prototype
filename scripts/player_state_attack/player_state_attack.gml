
if(state_new) {
    image_index = 0;
	sprite_index = animations_attack[0];
}

WASD_enabled = false;

if (image_index >= 1 && image_index <= 6) {
		with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_hitbox)) {
			image_xscale = other.image_xscale;
		}
}

if (key_attack) {
	if (combo == 0 && image_index >= 1 && image_index <= 6) {
		with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_hitbox)) {
			image_xscale = other.image_xscale;
		}
		image_index = 0; 
		sprite_index = animations_attack[1];
		x_speed += (5 * image_xscale/image_scale) * walk_accel;
	} 
	else if (combo == 1 && image_index >= 1 && image_index <= 6) {
		with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_hitbox)) {
			image_xscale = other.image_xscale;
		}
		image_index = 0; 
		sprite_index = animations_attack[2]; 
		x_speed += (5 * image_xscale/image_scale) * walk_accel;
	}
	
	alarm[0] = room_speed/3;
	combo += 1;
}

x_speed = clamp(x_speed,-dash_max,dash_max);
y_speed = clamp(y_speed,-dash_max,dash_max);

if (image_index+image_speed >= 6) state_switch("Idle");
