/// @description Draws blood to surface
surface_set_target(obj_surface.surface_gore);
draw_sprite_ext(spr_bloodSplat,irandom(image_number-1),x,y,2,2,0,c_white,1);
surface_reset_target();