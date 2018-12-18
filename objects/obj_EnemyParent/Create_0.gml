/// @description Insert description here
// You can write your code in this editor

path = path_add();

position = vector(x,y);

MASS = 6;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

MAX_SEE_AHEAD = 128;

MAX_SPEED = 3;
MAX_FORCE = 5;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 5;

steering		 = vector(0,0);
velocity		 = vector(0,0);
desired_velocity = vector(0,0);
avoidance		 = vector(0,0);