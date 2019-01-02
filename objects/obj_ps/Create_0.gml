/// @description Insert description here
// You can write your code in this editor

/// partical init
part_system = part_system_create();
part_emitter = part_emitter_create(part_system);

part_player_dust = part_type_create();
part_blood = part_type_create();

part_system_depth(part_system,-room_height);

// Dust 
part_type_colour2(part_player_dust, c_ltgray, c_ltgray);
part_type_size(part_player_dust, 5, 8, -0.2, 0);
part_type_shape(part_player_dust, pt_shape_pixel);
part_type_gravity(part_player_dust, 0.005, 90);
part_type_life(part_player_dust, 30, 60);

// Blood
part_type_size(part_blood, 2, 3, 0, 0);
part_type_sprite(part_blood,spr_blood,1,0,0);
part_type_orientation(part_blood, 0, 180, 0, 0, 0);
part_type_life(part_blood, 5, 15);
part_type_alpha3(part_blood,1,0.5,0);
