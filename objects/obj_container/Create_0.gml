/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

position = vector(0,0);
velocity = vector(0,0);

//z = -1;
//image_alpha = sprite_height / 255; //piggyback alpha channel to encode sprite height

//hurtbox
hurtbox = hurtbox_create(18,24,-9,-12);

//hitbox
hitbox = -1;

hit = false;
hitStun = 0;
hitBy = -1;

_health = pointer_null;
_spr_break = pointer_null;

tex = sprite_index;
vertexBuffer = obj_loader("plane.obj");
