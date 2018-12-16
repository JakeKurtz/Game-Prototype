/// @description Insert description here

var CELL_SIZE = 32;

var hcells = room_width div CELL_SIZE;
var vcells = room_height div CELL_SIZE;

global.grid = mp_grid_create(0, 0, hcells, vcells, CELL_SIZE, CELL_SIZE);

// Objects that are avoided
mp_grid_add_instances(global.grid, obj_WallParent, true);
//with obj_EnemyParent mp_grid_add_cell(global.grid, x >> 5, y >> 5);
//mp_grid_add_instances(global.grid, obj_EnemyParent, false);