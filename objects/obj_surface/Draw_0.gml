/// @description 

if !surface_exists(surface_floor) {
	surface_floor = surface_create(room_width, room_height);
	surface_set_target(obj_surface.surface_floor);
	draw_clear_alpha(c_black,0); // clear surface
	surface_reset_target();
} else {
	draw_surface(surface_floor,0,0);
}

// Surface used for gore
if !surface_exists(surface_gore) {
	surface_gore = surface_create(room_width, room_height);
	surface_set_target(obj_surface.surface_gore);
	draw_clear_alpha(c_black,0); // clear surface
	surface_reset_target();
} else {
	draw_surface_ext(surface_gore,0,0,1,1,0,c_white,1);
}

if !surface_exists(surface_shadow) {
	surface_shadow = surface_create(room_width, room_height);
	surface_set_target(obj_surface.surface_shadow);
	draw_clear_alpha(c_black,0); // clear surface
	surface_reset_target();
} else {
	//draw_surface(surface_shadow,0,0);
}

