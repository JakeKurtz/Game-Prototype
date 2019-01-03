/// @description Insert description here
// You can write your code in this editor

/// partical init
part_system = part_system_create();
part_emitter = part_emitter_create(part_system);

part_player_dust = part_type_create();
part_blood = part_type_create();
part_blood2 = part_type_create();

part_system_depth(part_system,-room_height);

// Dust 
part_type_colour2(part_player_dust, c_ltgray, c_ltgray);
part_type_size(part_player_dust, 5, 8, -0.2, 0);
part_type_shape(part_player_dust, pt_shape_pixel);
part_type_gravity(part_player_dust, 0.005, 90);
part_type_life(part_player_dust, 30, 60);

// Blood
/*
part_type_size(part_blood, 2, 3, 0, 0);
part_type_sprite(part_blood,spr_blood,1,0,0);
part_type_orientation(part_blood, 0, 180, 0, 0, 0);
part_type_life(part_blood, 5, 15);
part_type_alpha3(part_blood,1,0.5,0);

part_type_colour1(part_blood, c_red);
part_type_size(part_blood2, 1, 2, -0.01, 0);
part_type_shape(part_blood,pt_shape_pixel);
//part_type_speed(part_blood,0.5,2,0,0);
part_type_direction(part_blood,45,165,0,0);
part_type_orientation(part_blood,0,359,0,0,0);
part_type_life(part_blood, 10, 15);
part_type_gravity(part_blood, 0.3, 270);
//part_type_alpha3(part_blood,1,0.5,0);
*/
//part_type_colour1(part_blood2, c_red);
part_type_size(part_blood2, 2, 3, -0.01, 0);
part_type_sprite(part_blood2,spr_bloodExplosion2,0,0,1);
//part_type_orientation(part_blood,0,359,0,0,0);
//part_type_speed(part_blood2,1,5,0,0);
//part_type_direction(part_blood2,0,359,0,0);
part_type_life(part_blood2, 15, 25);
//part_type_blend(part_blood2,1);
part_type_gravity(part_blood2, 0.1, 270);