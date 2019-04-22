/// @description

shadow_size = 1;
shadow_height = 4*shadow_size; 
shadow_width = 9*shadow_size;

surface_set_target(obj_surface.surface_shadow);
gpu_set_fog(true, c_black, 0, 0);
draw_clear_alpha(c_black,0); // clear surface
draw_set_alpha(0.75);
draw_ellipse(x-shadow_width, y-shadow_height+9, x+shadow_width, y+shadow_height+9, false);
gpu_set_fog(false, c_black, 0, 0);
surface_reset_target();

draw_surface(obj_surface.surface_shadow,0,0);

draw_self();

// Flash white
flash -= flash_rate;
gpu_set_blendmode(bm_add);
shader_set(shd_flash);
shd_alpha = shader_get_uniform(shd_flash, "_alpha");
shader_set_uniform_f(shd_alpha, flash);

draw_self();
shader_reset();
gpu_set_blendmode(bm_normal);

if (flash <= 0 || flash >= 1) flash_rate *= -1;