/// @description pb_state_stand()
//The Standing State for Platform Boy
if(state_new) {
    x_speed=0;
    y_speed=0;
    sprite_index=spr_player_idle;
    image_index=0;
}

/*for (var i = 0; i < array_length_1d(walk_animations); i++){
    if (facing == i) sprite_index = walk_animations[i];
}*/

sprite_index = spr_player_idle;

if (key_attack) {
	state_switch("Attack");	
}

else if	(key_up && !place_meeting(x,y-1,obj_solid_nonentity) || 
		key_left && !place_meeting(x-1,y,obj_solid_nonentity) || 
		key_right && !place_meeting(x+1,y,obj_solid_nonentity) || 
		key_down && !place_meeting(x,y+1,obj_solid_nonentity)) {
		state_switch("Walk");
	}