/// @description Clean up
if (mean(vel_1,vel_2,vel_3) <= 0.015 && mean(zvel_1,zvel_2,zvel_3) == 0) {
	surface_set_target(obj_surface.surface_gore);
	draw_self();
	surface_reset_target();
	instance_destroy();	
}