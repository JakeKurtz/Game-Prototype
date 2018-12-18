
atk_type = "";
combo_stream = "";

//move_spd = 10;
//spd = move_spd;
//dash_spd = 25;

facing = 0;

//attack = false;
//dash = false;
//WASD_enabled = true;

image_spd = 1;
//image_speed = image_spd;

//wait_sec = 0;
//wait = false;

//alarm[0] = 15;

//command_list = ds_list_create(); // used for combos

/// @description Properties

slide_factor=2;

walk_max = 10;
walk_accel = 1.5;
decel = 0.5;

run_max = 4;
run_accel = .1;

//Changing Variables
x_speed = 0;
y_speed = 0;

//General Helpers
timer=0;
scale=1;

///Controls

//Directions
up_key = false;
down_key = false;
left_key = false;
right_key = false;

//Mobility
run_key = false;

#region // ANIMATION ARRAYS
walk_animations = array(spr_walk_up,
                        spr_walk_left,
                        spr_walk_right,
                        spr_walk_down);
                 
idle_animations = array(spr_walk_up,
                        spr_walk_left,
                        spr_walk_right,
                        spr_walk_down);
                            
attack_animations = array(spr_sword_up,
	                      spr_sword_left,
	                      spr_sword_right,
	                      spr_sword_down);				  
#endregion

///Setup State Machine for Platform Boy
state_machine_init();

//Define States

state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);
state_create("Attack",player_state_attack);

//Set the default state
state_init("Idle");
