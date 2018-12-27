/*///sb_alignment_grid(radius, grid controller, weight)
///Return vector2 for aligning velocity with given object in given radius
///Uses collision_circle_list from GMLscripts.com

var _align_radius = argument[0];
var _sb_grid_controller = argument[1];
var _weight = argument[2];

//Find total number of neighbours in a given radius
var _neighbours = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius);

if(_neighbours > 1) { // Has neighbours
    var _aligned_velocity = vect2(0,0);
    
    //Add all velocities together
    _aligned_velocity[@1] = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_velocity_x,x div sb_cell_size,y div sb_cell_size,_align_radius);
    _aligned_velocity[@2] = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_velocity_y,x div sb_cell_size,y div sb_cell_size,_align_radius);
    
    
    //return aligned velocity
    return (vect_multr(vect_norm(_aligned_velocity),_weight));
} else { // No neighbours
    return vect2(0,0);
}*/