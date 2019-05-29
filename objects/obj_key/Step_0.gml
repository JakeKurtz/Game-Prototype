/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)){
	sprite_index = spr_sparkle;
    ds_list_add(inventory, item_name);
}

if sprite_index == spr_sparkle && (image_index+image_speed >= image_number) instance_destroy();