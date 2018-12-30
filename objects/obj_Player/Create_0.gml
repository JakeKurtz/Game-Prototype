/// @description Properties

position = vector(0,0);
velocity = vector(0,0);

atk_type = "";
combo_stream = "";
command_list = ds_list_create();

walk_max = 8;
walk_accel = 1.5;
walk_decel = 0.5;

dash_max = 20;
dash_accel = 5;
dash_decel = 0.5;

//Changing Variables
x_speed = 0;
y_speed = 0;
facing = 0;
WASD_enabled = true;

//General Helpers
timer=0;
scale=1;

//Directions
up_key = false;
down_key = false;
left_key = false;
right_key = false;
attack_key = false
atk_hrd_key = false;
atk_light_key = false;
dash_key = false;

// Animation arrays
walk_animations = array(spr_player,
                        spr_player,
                        spr_player,
                        spr_player);
                 
attack_animations = array(spr_player,
	                      spr_player,
	                      spr_player,
	                      spr_player);

state_machine_init();

//Define States
state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);
state_create("Attack",player_state_attack);
state_create("Dash",player_state_dash);

//Set the default state
state_init("Idle");