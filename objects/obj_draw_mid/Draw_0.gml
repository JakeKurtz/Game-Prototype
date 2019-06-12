/// @description 

//check if the castor surface exists
if(!surface_exists(surface_castor)){
    //if it does not exist, recreate it
    surface_castor = surface_create(room_width,room_height);
	//bind surface
	surface_set_target(surface_castor);
	//clear with the ambient color
	draw_clear_alpha(c_black,0); // clear surface
	surface_reset_target();
} else {

	// crap you want to do here...

	//draw the surface to the screen
	draw_surface(surface_castor,0,0);
}