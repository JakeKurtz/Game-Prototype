if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
}

sprite_index = idle_animations[0];

if (state_timer >= irandom_range(120,500)) state_switch_previous();

// If the enemey spots the player, change to pursue state.
if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_player) <= SIGHT_RADIUS) {
	//velocity[1] = 0;
	//velocity[2] = 0;
	//sprite_index = spr_minotaur_taunt;
	state_switch("Pursue");	
}