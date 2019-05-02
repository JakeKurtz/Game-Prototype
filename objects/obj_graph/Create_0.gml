/// @description

color_defualt = c_dkgray;
//color_highlight = make_colour_rgb(109,208,247);

color_highlight_1 = make_colour_rgb(109,208,247);
color_highlight_2 = make_colour_rgb(109,208,247);

// list of all active vertices
//active_vertices = ds_list_create();
//active_edges = 0;

active_vertices_1 = ds_list_create();
active_vertices_2 = ds_list_create();

active_edges_1 = 0;
active_edges_2 = 0;

// number of vertices
n = instance_number(obj_vertex);

// number of edges
e = 0;

// set edges
edges = init_edges(n,n);

// getting all instances into a list
vertex = ds_list_create();

for (var i = 0; i < n; i ++) {
   ds_list_add(vertex, instance_find(obj_vertex, i));
}