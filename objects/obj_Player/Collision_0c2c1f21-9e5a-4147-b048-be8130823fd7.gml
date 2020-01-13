/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_room_trans) {
	var temp_room_fade;
	temp_room_fade = instance_create_layer(x,y,"Instances",obj_room_trans);
	temp_room_fade.temp_target = other.target_room;
}

//x = other.target_x;
//y = other.target_y;