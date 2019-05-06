/// @description Enemy properties skeleton

path = path_add();
path_patrol = path0;

image_scale = global.image_scale;
default_image_speed = 0.5;

#region // Steering constants
MASS = 15;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

SIGHT_RADIUS = 500;
MAX_SEE_AHEAD = 128;

MAX_SPEED = 2;
MAX_FORCE = 10;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 10;
#endregion

#region // Steering vectors
position		 = vector(x,y);
steering		 = vector(0,0);
velocity		 = vector(0,0);
desired_velocity = vector(0,0);
avoidance		 = vector(0,0);
#endregion

my_path_dir = 1;
facing = 0;
flash = 0;
can_seek = false;

image_speed = default_image_speed;
image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;


state_machine_init();
