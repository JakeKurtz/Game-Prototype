/// @description  Animation and Movment Controller

// TODO : After the player has finished the first attack animation, make it so 
//        that the player can inturrupt the sequence and enter the dash or walk states. 

// TODO : Make the collsions less clunky

#region // MOVEMENT INPUT

var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));
var left_key = keyboard_check(ord("A"));
var right_key = keyboard_check(ord("D"));
var space_key = keyboard_check_pressed(vk_space);
var atk_light_key = mouse_check_button_pressed(mb_left);
var atk_hard_key = mouse_check_button_pressed(mb_right);

var wasd_key = (up_key || left_key || right_key || down_key);

#endregion

// CHECKING PLAYER ACTION
var walk = wasd_key && !attack;
var diag = (up_key || down_key) && (left_key || right_key);
var idle = !walk && !attack;

#region // ANIMATION ARRAYS

var walk_animations = array(spr_walk_up,
                            spr_walk_left,
                            spr_walk_right,
                            spr_walk_down);
                 
var idle_animations = array(spr_walk_up,
                            spr_walk_left,
                            spr_walk_right,
                            spr_walk_down);
                            
var attack_animations = array(spr_sword_up,
                              spr_sword_left,
                              spr_sword_right,
                              spr_sword_down);
							  
#endregion

#region // Getting direction of player

if WASD_enabled {
    if up_key                  facing = 0;
    if left_key                facing = 1;
    if right_key               facing = 2;
    if down_key                facing = 3;
    if (up_key && left_key)    facing = 0;
    if (up_key && right_key)   facing = 0;
    if (down_key && left_key)  facing = 3;
    if (down_key && right_key) facing = 3;
} 

#endregion


// if you notice the player drifting when idle, then it's most likely the following.
// x = 4/0.4 s.t x MUST be an integer
var accel = 1.5;
var decel = 0.5;


// Setting alarm for dash
if (space_key && !dash && !wait){
    dash = true; 
    spd = dash_spd;
}

show_debug_message(string(ds_list_size(command_list)));

if atk_light_key combo_stream += "+atk_light";
if atk_hard_key combo_stream += "+atk_hard";

if (atk_light_key && !dash || atk_hard_key && !dash) attack = true; 

ds_list_add(command_list, string_delete(combo_stream, 1, 1)); // removes '+' from string

while(ds_list_size(command_list) > 4) {
	ds_list_delete(command_list, 0);	
}
			
// FSM: movement and animation
for (var i = 0; i < 4; i++){
    if facing == i {
		
        #region // WALKING
		
        if walk sprite_index = walk_animations[i];
		
		#endregion
		
        #region // IDLE
		
        if idle {
            sprite_index = idle_animations[i];
			image_index = 0;
        } 
		
		#endregion

        #region // DASHING
		
        if dash {
			accel = accel * dash_spd;
			WASD_enabled = false;
            //sprite_index = dash_animations[i];
        } 
		
		#endregion

        #region // ATTACKING 
		
        if attack {
			accel = 0;
			WASD_enabled = false;
			if sprite_index != attack_animations[i] image_index = 0;
			
			if (ds_list_find_value(command_list, ds_list_size(command_list)-1) == "atk_light") {
				sprite_index = attack_animations[i];
				//show_debug_message("atk_light");
			} //else if(ds_list_find_value(command_list, ds_list_size(command_list)-1) == "atk_hard") {
			    //show_debug_message("atk_strong");
			//} //else if(ds_list_find_value(command_list, ds_list_size(command_list)-1) == "atk_light + atk_strong") {
			    //atk_type = "Uppercut";
				//show_debug_message("atk_both");
			//}
			
            if (image_index+image_speed >= image_number) {
                //image_speed = 0;
                //wait = true;
				attack = false;
                WASD_enabled = true;
            }
        } 
		
		#endregion
		
    }
}

hsp += (-left_key + right_key) * accel;
if (hsp != 0) hsp -= (decel * sign(hsp))
vsp += (-up_key + down_key) * accel;
if (vsp != 0) vsp -= (decel * sign(vsp))

// clamps limit speed to the given max/min
hsp = clamp(hsp,-spd,spd);
vsp = clamp(vsp,-spd,spd);

#region // horizontal collision
if (place_meeting(x+hsp,y,obj_WallParent)) {
    while(!place_meeting(x+sign(hsp),y,obj_WallParent)) x += sign(hsp);
	if dash global.camera_shake = true;
    hsp = 0;
} #endregion
x += hsp;
 
#region // vertical collision
if (place_meeting(x,y+vsp,obj_WallParent)) {
    while(!place_meeting(x,y+sign(vsp),obj_WallParent)) y += sign(vsp);
	if dash global.camera_shake = true;
    vsp = 0;
} #endregion
y += vsp;