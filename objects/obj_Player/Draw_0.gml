/// @description Draw Shadow and sprite

shadow_size = 1;
shadow_height = 8*shadow_size; 
shadow_width = 20*shadow_size;

surface_set_target(obj_surface.surface_shadow);
gpu_set_fog(true, c_black, 0, 0);
draw_clear_alpha(c_black,0); // clear surface
draw_set_alpha(0.75);
draw_ellipse(x-shadow_width, y-shadow_height+15, x+shadow_width, y+shadow_height+15, false);
gpu_set_fog(false, c_black, 0, 0);
surface_reset_target();

draw_surface(obj_surface.surface_shadow,0,0);

draw_self();