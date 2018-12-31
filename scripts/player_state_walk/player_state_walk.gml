/// @description

if(state_new) {
    image_index = 1;
}

WASD_enabled = true;

sprite_index = spr_player_walk;

x_speed += (-left_key + right_key) * walk_accel;
y_speed += (-up_key + down_key) * walk_accel;

x_speed = clamp(x_speed,-walk_max,walk_max);
y_speed = clamp(y_speed,-walk_max,walk_max);

if (dash_key) {
	state_switch("Dash");
}

else if (attack_key) {
	state_switch("Attack");	
}

else if (x_speed == 0 && y_speed == 0) state_switch("Idle");