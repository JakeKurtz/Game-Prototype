/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (_health <= 0 && flag) {
	flag = false;
	// rumble the camera
	global.camera_shake = true;
	// explosion
	for (var i = 0; i < irandom_range(3,5); i++) {
	    instance_create_layer(x+irandom_range(-15,15),y+irandom_range(-15,15),"Instances", obj_fireBall_explode);
	}
	// spawn hitbox
	if (hitbox == -1) hitbox = hitbox_create(128, 128, -64, -64, 15, 3, 45);
}

// If you get hit
if (hit) {
	hit = false;
	image_speed = 1;
	_health -= hitBy.owner.damage;
}

if (_health <= 0) {
	sprite_index = _spr_break;
	image_speed = 1;
	
	if (image_index+image_speed >= image_number) {
		surface_set_target(obj_surface.surface_gore);
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
		surface_reset_target();
		instance_destroy();
	}
}

if (image_index+image_speed >= image_number) {
	image_speed = 0;
	image_index = 0;
}