if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
}

var dir = point_direction(x,y,obj_player.x,obj_player.y)

if (dir >= 0 && dir < 45) facing = 2;
else if (dir >= 45 && dir < 90) facing = 0;
else if (dir >= 90 && dir < 135) facing = 0;
else if (dir >= 135 && dir < 180) facing = 1;
else if (dir >= 180 && dir < 225) facing = 1;
else if (dir >= 225 && dir < 270) facing = 3;
else if (dir >= 270 && dir < 315) facing = 3;
else facing = 2;

sprite_index = attack_animations[0];

if (image_index+image_speed >= image_number) {
	sprite_index = attack_animations[1];	
}

if (distance_to_object(obj_player) > r_attack_range) state_switch("Pursue");
else if (distance_to_object(obj_player) < flee_range) state_switch("Flee");
