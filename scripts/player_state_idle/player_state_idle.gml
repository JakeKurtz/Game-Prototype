/// @description pb_state_stand()
//The Standing State for Platform Boy
if(state_new) {
    x_speed=0;
    y_speed=0;
    image_speed=0;
    sprite_index=spr_walk_down;
    image_index=0;
}

for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

if (attack_key) {
	state_switch("Attack");	
}

else if	(up_key && !place_meeting(x,y-1,obj_solid_nonentity) || 
		left_key && !place_meeting(x-1,y,obj_solid_nonentity) || 
		right_key && !place_meeting(x+1,y,obj_solid_nonentity) || 
		down_key && !place_meeting(x,y+1,obj_solid_nonentity)) {
		state_switch("Walk");
	}