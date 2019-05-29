/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (_health <= 0) {
	sprite_index = _spr_break;
	image_speed = 1;
	/*	
	// spawn some health maybe
	if (irandom_range(1,30) == 1) {
		for (var i = 0; i < irandom_range(1,6); ++i) {
		    instance_create_layer(x,y, "Compatibility_Instances_Depth_0", obj_hp_5);
		}
	}
	
	if (irandom_range(1,50) == 1) {
		for (var i = 0; i < irandom_range(1,3); ++i) {
			instance_create_layer(x,y, "Compatibility_Instances_Depth_0", obj_hp_15);
		}
	}*/
	
	if (image_index+image_speed >= image_number) {
		surface_set_target(obj_surface.surface_gore);
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
		surface_reset_target();
		instance_destroy();
	}
}

// If you get hit
if (hit) {
	hit = false;
	image_speed = 1;
	_health -= hitBy.owner.damage;
}

if (image_index+image_speed >= image_number) {
	image_speed = 0;
	image_index = 0;
}