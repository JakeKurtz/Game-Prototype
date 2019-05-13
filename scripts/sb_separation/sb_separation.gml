///@function sb_separation
///@arg object
///@arg radius
///@arg weight
///@ret vector2 for separating from given objects within set radius
///Uses collision_circle_list from GMLscripts.com

var _sep_obj = argument[0];
var _sep_radius = argument[1];
var _weight = argument[2];
var _neighbour_list = ds_list_create();

var _neighbour_num = collision_circle_list(position[1], position[2], _sep_radius, _sep_obj, false, true, _neighbour_list, false);

if(_neighbour_list != noone) { // Has neighbours
    var _aligned_position = vector(0,0);
    
    for(var i = 0; i < _neighbour_num; i++) {
        _aligned_position = vector_add(_aligned_position, _neighbour_list[|i].position);
    }
    
    _aligned_position = vector_divr(_aligned_position, _neighbour_num);

    //destroy temp ds_list
    ds_list_destroy(_neighbour_list);
    
    //return aligned velocity
    return (vector_mulr(vector_norm(vector_sub(position,_aligned_position)),_weight));
} else { // No neighbours
    return vector(0,0);
}