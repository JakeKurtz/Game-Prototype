if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	image_speed = 0;
}

//if (state_timer >= 120) state_switch("Patrol");

if (place_meeting(x,y,obj_Player) && obj_Player.state_name == "Dash") state_switch("Airborn");