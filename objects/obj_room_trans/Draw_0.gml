/// @description drawing fade

fade_alpha = clamp(fade_alpha + (fade_speed * fade_state), 0, 1);

if (fade_alpha == 1) {
	room_goto(temp_target);
	fade_state = -1;
}

if (fade_alpha == 0 && fade_state == -1) {
	instance_destroy();	
}

draw_set_colour(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0,0, room_width, room_height, 0); // when you start using views, make sure to draw only for the view.
draw_set_alpha(1);
