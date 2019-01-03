/// @description Enemy properties skeleton

path = path_add();
path_patrol = path0;

position = vector(x,y);

MASS = 15;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

SIGHT_RADIUS = 500;

MAX_SEE_AHEAD = 128;

MAX_SPEED = 4;
MAX_FORCE = 20;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 10;

steering		 = vector(0,0);
velocity		 = vector(0,0);
desired_velocity = vector(0,0);
avoidance		 = vector(0,0);

my_path_dir = 1;
facing = 0;
can_seek = false;

shadow_size = 1;
shadow_height = 45*shadow_size; 
shadow_width = 40*shadow_size;

// Animation arrays
walk_animations = array();
                 
attack_animations = array();

state_machine_init();

//Define States

//Set the default state
//state_init("Follow");
