/*///sb_cohesion_grid2(radius, grid controller, weight)
///Return vector2 for aligning location with others in given radius (grid based)

//Alternate methodolgy of cohesion compared to sb_cohesion_grid.
//Both use same arguments and seem to have similar CPU usage.
//Basic idea is find the cell with the most entities in a given radius 
//and move towards the centre of mass of that cell.

var _align_radius = argument[0];
var _sb_grid_controller = argument[1];
var _weight = argument[2];

//get the maximum value for entities per cell in the given radius
var _neighbour_cell = ds_grid_get_disk_max(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius);

if(_neighbour_cell > 1) { // Has neighbours
    //Find which cell actually has the maximum
    var _neighbour_cell_x = ds_grid_value_disk_x(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius,_neighbour_cell);
    var _neighbour_cell_y = ds_grid_value_disk_y(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius,_neighbour_cell);
    //Get centre of mass (based on average XY values of entities)
    var _mass_x = _sb_grid_controller.sb_grid_center_x[#_neighbour_cell_x,_neighbour_cell_y]/_sb_grid_controller.sb_grid_count[#_neighbour_cell_x,_neighbour_cell_y];
    var _mass_y = _sb_grid_controller.sb_grid_center_y[#_neighbour_cell_x,_neighbour_cell_y]/_sb_grid_controller.sb_grid_count[#_neighbour_cell_x,_neighbour_cell_y];
    
    //Generate position to move towards
    var _aligned_position = vect2(_mass_x,_mass_y);

    //return aligned velocity
    return (vect_multr(vect_norm(vect_subtract(_aligned_position,position)),_weight));
} else { // No neighbours
    return vect2(0,0);
}*/