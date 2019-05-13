/// @description Insert description here
// You can write your code in this editor

event_inherited();

image_speed = 2;

SPEED = 20;
MAX_FORCE = 1;
MASS = 1;

state_machine_init();

//Define States
state_create("Seek",fireball_state_seek);
state_create("Die", fireball_state_die);

//Set the default state
state_init("Seek");