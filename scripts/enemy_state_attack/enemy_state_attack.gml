if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	image_speed = 0;
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

for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

if (distance_to_object(obj_player) > 32) state_switch("Pursue");
