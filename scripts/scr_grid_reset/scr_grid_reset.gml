/*///scr_grid_reset(cell_size);
//This script can be used by the steering behaviour grid controller (cont_steering).
//It recreates the ds_grids used for flocking with the specified cell size.
//After the ds_grids are recreated it tells all the drones to use the new cell size.
//If the drones are created after this script is run, that step would be unnecessary, 
//but I left it in for completeness.
//
//This script is in no way necessary to use.
//You can specify the cell size in cont_steering itself (default is 16x16)
//and everything will work. I made this mostly for demo purposes.

//Create list of grids to be used
var grid_list;
grid_list[0] = sb_grid_count;
grid_list[1] = sb_grid_velocity_x;
grid_list[2] = sb_grid_velocity_y;
grid_list[3] = sb_grid_center_x;
grid_list[4] = sb_grid_center_y;
grid_list[5] = sb_grid_ids;

//Destroy them if they exist (to prevent memory leaks)
for(i=0; i<array_length_1d(grid_list)-1; i++) {
    if(ds_exists(grid_list[i], ds_type_grid)) {
        ds_grid_destroy(grid_list[i]);
    }
}

//Width and Height in pixels of grid squares used for Steering Behaviours.
//Lower numbers results in a finer grid, but uses more CPU
sb_cell_size = argument[0]; 
//Generate the grid size based on the sb_cell_size fit to fill the entire room
grid_width = (room_width div sb_cell_size)+1;
grid_height = (room_height div sb_cell_size)+1;

//Generate grids
sb_grid_count = ds_grid_create(grid_width, grid_height); //Used to store the number of entities per square
sb_grid_velocity_x = ds_grid_create(grid_width, grid_height); //Stores X velocities
sb_grid_velocity_y = ds_grid_create(grid_width, grid_height); //Stores Y velocities
sb_grid_center_x = ds_grid_create(grid_width, grid_height); //Stores X positions
sb_grid_center_y = ds_grid_create(grid_width, grid_height); //Stores Y positions
sb_grid_ids = ds_grid_create(grid_width, grid_height); //Stores unique IDs of objects

//Make sure grids are empty
ds_grid_clear(sb_grid_count, 0);
ds_grid_clear(sb_grid_velocity_x, 0);
ds_grid_clear(sb_grid_velocity_y, 0);
ds_grid_clear(sb_grid_center_x, 0);
ds_grid_clear(sb_grid_center_y, 0);
ds_grid_clear(sb_grid_ids, 0);

//Update drones to use new cell size.
//If you intend on using multiple grid controllers you will need to modify this.
//This is intentionally simple for demo purposes.
if(instance_exists(par_drone)) {
    with(par_drone) {
        sb_cell_size = other.sb_cell_size;
    }
}*/