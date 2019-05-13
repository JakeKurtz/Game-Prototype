///@function e_state_flee
///@arg speed

if (state_new) {
    SPEED = speed_flee;
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