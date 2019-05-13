///@function e_state_pursue
///@arg speed

if (state_new) {
	aggressive = true;
    SPEED = speed_pursue;
	image_index = 0;
}

sprite_index = walk_animations[0];
var _distance_to_player = distance_to_point(obj_player.x,obj_player.y);

if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 1)) {
	steering = vector_add(steering, sb_path_pursue(path,1,1,3));
}

// If enemy gets close enough to the player, then it starts its ranged/melee attack.
// Otherwise, if the player gets any closer, it trys to run away.
if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0))) {
	if (r_attack_range != -1 && _distance_to_player <= r_attack_range && _distance_to_player > flee_range) {
		if can_attack state_switch("Ranged Attack");
		else state_switch("Idle");
	} else if (flee_range != -1 && _distance_to_player <= flee_range && _distance_to_player > m_attack_range) {
		state_switch("Flee");
	} else if (_distance_to_player <= m_attack_range) { 
		if can_attack state_switch("Melee Attack");
		else state_switch("Idle");
	}
}