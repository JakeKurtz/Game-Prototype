/*///sb_separation_grid(radius, grid controller, weight)
///Return vector2 for separating from given objects within set radius (grid based)

//sb_separation_grid2 works a lot better. 
//I consider this version to be buggy but I have left it in for people to mess with.
//Both steering behaviours use the same arguments and use similar amounts of CPU.

var _align_radius = argument[0];
var _sb_grid_controller = argument[1];
var _weight = argument[2];

//Get total number of neighbours
var _neighbours = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius);

if(_neighbours > 1) { // Has neighbours
    var _aligned_position = vect2(0,0);
    
    //Add all XY values together and divide by number of neighbours
    _aligned_position[1] = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_center_x,x div sb_cell_size,y div sb_cell_size,_align_radius)/_neighbours;
    _aligned_position[2] = ds_grid_get_disk_sum(_sb_grid_controller.sb_grid_center_y,x div sb_cell_size,y div sb_cell_size,_align_radius/_neighbours);

    
    //return aligned velocity
    return (vect_multr(vect_norm(vect_subtract(position,_aligned_position)),_weight));
} else { // No neighbours
    return vect2(0,0);
}*/