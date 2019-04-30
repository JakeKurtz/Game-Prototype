/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

y+=z;
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

y-=z;

if (flash <= 0 || flash >= 1) flash_rate *= -1;