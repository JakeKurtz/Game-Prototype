/*///sb_cohesion_grid(radius, grid controller, weight)
///Return vector2 for aligning location with others in given radius (grid based)

//sb_cohesion_grid2 achieves more or less the same effect, 
//although uses a different approach. Both steering behaviours use the same arguments.

var _align_radius = argument[0];
var _sb_grid_controller = argument[1];
var _weight = argument[2];

//Find total number of neighbours in given radius
var _neighbours = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius);

if(_neighbours > 1) { // Has neighbours
    //Position to move towards
    var _aligned_position = vect2(0,0);

    //Divide XY positions by number of neighbours
    _aligned_position[1] = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_center_x,x div sb_cell_size,y div sb_cell_size,_align_radius)/_neighbours;
    _aligned_position[2] = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_center_y,x div sb_cell_size,y div sb_cell_size,_align_radius)/_neighbours;
    
    //return aligned velocity
    return (vect_multr(vect_norm(vect_subtract(_aligned_position,position)),_weight));
} else { // No neighbours
    return vect2(0,0);
}*/