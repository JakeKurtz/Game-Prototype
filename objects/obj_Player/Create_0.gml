/// @description Properties
// TODO : Organize

foo = 0;
sword = true;
bomb = false;

//hurtbox
hurtbox = hurtbox_create(18,22,-9,-12);

//hitbox
hitbox = -1;

hit = false;
hitStun = 0;
hitBy = -1;

_health = 500;
damage = 25;
take_damage = true;
flash = 0;
image_scale = global.image_scale;
default_image_speed = 0.7;

image_speed = default_image_speed;
image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

position = vector(0,0);
velocity = vector(0,0);

globalvar inventory;
inventory = ds_list_create();

atk_type = "";
combo_stream = "";
command_list = ds_list_create();
combo = 0;

walk_max = 5;
walk_accel = 1.5;
walk_decel = 0.5;

dash_max = 10;
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
key_up = false;
key_down = false;
key_left = false;
key_right = false;
key_attack = false
key_atk_hrd = false;
key_atk_light = false;
key_dash = false;

// Animation arrays
animations_idle = array(spr_player_idle);

animations_walk = array(spr_player_walk);
                 
animations_attack = array(spr_player_attack1,
	                      spr_player_attack2,
	                      spr_player_attack3,);
						  
// Attack Points around player
atk_point_map = ds_map_create();
nmb_atk_points = 8;
atk_point_interval = 360/nmb_atk_points;

for (var i = 0; i < nmb_atk_points; ++i) {
	ds_map_replace(atk_point_map,string(i*atk_point_interval),false);
}

instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_player_footbox);
state_machine_init();

//Define States
state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);
state_create("Attack",player_state_attack);
state_create("Dash",player_state_dash);
state_create("Stun",player_state_stun);

//Set the default state
state_init("Idle");