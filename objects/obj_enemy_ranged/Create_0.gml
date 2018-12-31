/// @description Insert description here
// You can write your code in this editor

image_scale = 2;

image_speed = 0.5;
image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

path = path_add();
path_patrol = path0;

r_attack_range = 250;
m_attack_range =32;
flee_range = 150;

my_path_dir = 1;
my_path_position = 0;
facing = 0;
can_seek = false;

shadow_size = 1;
shadow_height = 45*shadow_size; 
shadow_width = 40*shadow_size;

#region // Steering constants
MASS = 5;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

SIGHT_RADIUS = 500;
MAX_SEE_AHEAD = 128;

MAX_SPEED = 4;
MAX_FORCE = 5;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 5;
#endregion

#region // Steering vectors
position = vector(x,y);
steering = vector(0,0);
velocity = vector(0,0);
desired_velocity = vector(0,0);
avoidance = vector(0,0);
#endregion

#region // Animation arrays
walk_animations = array(spr_enemy,
                        spr_enemy,
                        spr_enemy,
                        spr_enemy);
                 
attack_animations = array(spr_enemy,
	                      spr_enemy,
	                      spr_enemy,
	                      spr_enemy);
#endregion

state_machine_init();

#region //Define States
state_create("Patrol",enemy_state_patrol);
state_create("Idle",enemy_state_idle);
state_create("Pursue",enemy_state_r_pursue);
state_create("Ranged Attack",enemy_state_r_attack);
state_create("Melee Attack",enemy_state_m_attack);
state_create("Flee",enemy_state_r_flee);
#endregion

//Set the default state
state_init("Patrol");