if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	sprite_index = attack_animations[irandom(array_length_1d(attack_animations)-1)];
}

var _distance_to_player = distance_to_object(obj_player);
var dir = point_direction(x,y,obj_player.x,obj_player.y)

if (dir >= 0 && dir < 45) facing = 2;
else if (dir >= 45 && dir < 90) facing = 0;
else if (dir >= 90 && dir < 135) facing = 0;
else if (dir >= 135 && dir < 180) facing = 1;
else if (dir >= 180 && dir < 225) facing = 1;
else if (dir >= 225 && dir < 270) facing = 3;
else if (dir >= 270 && dir < 315) facing = 3;
else facing = 2;

if (_distance_to_player <= r_attack_range && _distance_to_player > flee_range) {
	state_switch("Ranged Attack");
} else if (_distance_to_player <= flee_range && _distance_to_player > m_attack_range) {
	state_switch("Flee");
} else if (_distance_to_player > r_attack_range) state_switch("Pursue");

if (image_index+image_speed >= image_number && can_attack) {
	alarm[1] = irandom_range(30,60);
	can_attack = false;
}
