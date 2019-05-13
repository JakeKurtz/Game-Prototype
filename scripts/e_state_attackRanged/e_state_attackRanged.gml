if(state_new) {
	image_index = 0;
	sprite_index = attack_animations[irandom(array_length_1d(attack_animations)-1)];
	with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_fireBall)) {
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	can_attack = false;
}

velocity[1] = 0;
velocity[2] = 0;

var min_frame; 
var max_frame;

// Makes sure the enemy is facing the player.
var vector_dir = point_direction(x,y,obj_player.x,obj_player.y)
	
if ((vector_dir >= 0 && vector_dir <= 70) || (vector_dir >= 290 && vector_dir <= 360)) image_xscale = image_scale;
else if (vector_dir >= 110 && vector_dir <= 250) image_xscale = -image_scale;

// The frames when the hitbox should be spawned in.
if sprite_index == attack_animations[0] {
	min_frame = 1;
	max_frame = 2;
}

// Paces out attacks
if (image_index+image_speed >= image_number) {
	alarm[1] = irandom_range(60, 240);
	state_switch("Idle");
}
