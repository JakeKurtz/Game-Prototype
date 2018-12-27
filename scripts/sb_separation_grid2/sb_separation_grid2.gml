/*///sb_separation_grid2(radius, grid controller, weight)
///Return vector2 for separating from given objects within set radius (grid based)

//This is a much improved version of sb_separation_grid.
//Both steering behaviours use the same arguments and use similar amounts of CPU.

//This is essentially the opposite of sb_cohesion_grid2
//It finds the cell with the most entities, gets the centre of mass,
//then moves away from it instead of towards it.


var _align_radius = argument[0];
var _sb_grid_controller = argument[1];
var _weight = argument[2];

//Find value of cell with most entities in given radius
var _neighbour_cell = ds_grid_get_disk_max(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius);

if(_neighbour_cell > 1) { // Has neighbours
    //Find the actual cell with said number of entities
    var _neighbour_cell_x = ds_grid_value_disk_x(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius,_neighbour_cell);
    var _neighbour_cell_y = ds_grid_value_disk_y(_sb_grid_controller.sb_grid_count,x div sb_cell_size,y div sb_cell_size,_align_radius,_neighbour_cell);
    //Find centre of mass within said cell
    var _mass_x = _sb_grid_controller.sb_grid_center_x[#_neighbour_cell_x,_neighbour_cell_y]/_sb_grid_controller.sb_grid_count[#_neighbour_cell_x,_neighbour_cell_y];
    var _mass_y = _sb_grid_controller.sb_grid_center_y[#_neighbour_cell_x,_neighbour_cell_y]/_sb_grid_controller.sb_grid_count[#_neighbour_cell_x,_neighbour_cell_y];
    
    var _aligned_position = vect2(_mass_x,_mass_y);
    
    //return aligned velocity
    return (vect_multr(vect_norm(vect_subtract(position,_aligned_position)),_weight));
} else { // No neighbours
    return vect2(0,0);
}*/