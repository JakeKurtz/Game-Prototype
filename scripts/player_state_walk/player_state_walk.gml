/// @description

if(state_new) {
    image_index = 1;
}

WASD_enabled = true;

sprite_index = spr_player_walk;

x_speed += (-key_left + key_right) * walk_accel;
y_speed += (-key_up + key_down) * walk_accel;

x_speed = clamp(x_speed,-walk_max,walk_max);
y_speed = clamp(y_speed,-walk_max,walk_max);

if (key_dash) {
	state_switch("Dash");
}
else if (key_attack) {
	state_switch("Attack");	
}
else if (x_speed == 0 && y_speed == 0) state_switch("Idle");