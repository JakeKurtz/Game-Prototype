///@function sb_avoid_collision(object, see_ahead_distance, max_avoidance_force, weight)
///@arg object
///@arg see_ahead_distance
///@arg max_avoidance_force
///@arg weight
///@ret vector2 for avoiding colliding with specified object

///Requires collision_line_first from GMLscripts.com
///Objects used for avoidance must have position (vect2) variables set.
///If they move, they must also update their position variables in their step event.

//Note that this steering behaviour will try to avoid the given object, 
//but in no way will it actually prevent it from moving inside said object, 
//for example if the weighting of other steering behaviours overpowers this one. 
//Please see the solid_obj variable in obj_drone_flock_grid2 if you need that functionality.

var avoid_obj = argument[0];
var see_ahead_distance = argument[1];
var max_avoidance_force = argument[2];
var weight = argument[3];

//Actual XY position at end of line _see_ahead_distance length away from current position
var see_ahead = vector_add(position, vector_mulr(vector_norm(velocity), see_ahead_distance));
//Find oject to avoid at this point
var nearest_obj = collision_line_first(position[1], 
									   position[2],
                                       see_ahead[1], 
									   see_ahead[2],
                                       avoid_obj,
                                       true,
                                       true);

if(nearest_obj != noone) { //Object found
    //Move away from object
    var avoidance_force = vector_sub(see_ahead, nearest_obj.position);
    avoidance_force = vector_norm(avoidance_force);
    avoidance_force = vector_mulr(avoidance_force, max_avoidance_force);
    
    return vector_mulr(avoidance_force, weight);
} else return vector(0,0);