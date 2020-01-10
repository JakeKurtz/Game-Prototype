///@function hurtbox_create
///@arg xscale
///@arg yscale
///@arg xOffset
///@arg yOffset

_hurtbox = instance_create_layer(x, y, "Instances", obj_hurtbox);
_hurtbox.owner = id;
_hurtbox.image_xscale = argument0;
_hurtbox.image_yscale = argument1;
_hurtbox.xOffset = argument2;
_hurtbox.yOffset = argument3;

return _hurtbox;