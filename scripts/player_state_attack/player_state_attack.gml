// TODO : After the player has finished the first attack animation, make it so 
//        that the player can inturrupt the sequence and enter the dash or walk states. 
// TODO : Clean this shit up.
// TODO : Also, make a combo system.

if(state_new) {
    image_index = 0;
}

WASD_enabled = false;

//if sprite_index != attack_animations[i] image_index = 0;
			
//if (ds_list_find_value(command_list, ds_list_size(command_list)-1) == "atk_light") {
	//sprite_index = attack_animations[i];
	//show_debug_message("atk_light");
//} //else if(ds_list_find_value(command_list, ds_list_size(command_list)-1) == "atk_hard") {
	//show_debug_message("atk_strong");
//} //else if(ds_list_find_value(command_list, ds_list_size(command_list)-1) == "atk_light + atk_strong") {
	//atk_type = "Uppercut";
	//show_debug_message("atk_both");
//}

/*if (atk_light_key) combo_stream += "+atk_light";
if (atk_hard_key) combo_stream += "+atk_hard";

ds_list_add(command_list, string_delete(combo_stream, 1, 1)); // removes '+' from string

while(ds_list_size(command_list) >= 4) {
	ds_list_delete(command_list, 0);	
}

show_debug_message(string(combo_stream));
*/

sprite_index = attack_animations[0];

if (image_index+image_speed >= image_number) state_switch("Idle");
