if(state_new) {
    image_speed = 0;
    image_index = 1;
	state_x_dir = (-key_left + key_right);
	state_y_dir = (-key_up + key_down);
}

//WASD_enabled = false;

x_speed += state_x_dir * dash_accel;
y_speed += state_y_dir * dash_accel;

x_speed = clamp(x_speed,-dash_max,dash_max);
y_speed = clamp(y_speed,-dash_max,dash_max);

if (state_timer >= 15) {
	image_speed = default_image_speed; 
	state_switch("Walk");
}