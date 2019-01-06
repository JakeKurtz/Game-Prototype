/// @description Clean up

if (vector_len(velocity) == 0) {
	surface_set_target(obj_surface.surface_gore);
	draw_self();
	surface_reset_target();
	instance_destroy();	
}