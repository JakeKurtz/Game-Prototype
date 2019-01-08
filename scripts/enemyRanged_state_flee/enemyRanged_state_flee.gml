if (state_new) {
    MAX_SPEED = 5;
	image_index = 0;
}

sprite_index = walk_animations[0];

var _distance_to_player = distance_to_object(obj_player);

if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0))) {
	if (_distance_to_player <= m_attack_range) {
		state_switch("Melee Attack");
	} if (_distance_to_player > r_attack_range) {
		state_switch("Ranged Attack");
	}
} else if (_distance_to_player > r_attack_range) state_switch("Pursue");

steering = vector_add(steering, sb_evade(obj_player, 1));

steering = vector_add(steering, sb_avoid_collision(obj_solid_nonentity,64,MAX_AVOID_FORCE,5));

steering = vector_add(steering, sb_separation(object_index,50,3));
steering = vector_add(steering, sb_alignment(object_index,40,2));
steering = vector_add(steering, sb_queue(object_index, 32, 32));

steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);