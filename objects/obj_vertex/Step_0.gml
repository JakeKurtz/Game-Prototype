/// @description setting vertex color

red = ds_list_find_index(obj_graph.active_vertices_1, id);
blue = ds_list_find_index(obj_graph.active_vertices_2, id);

if (red == -1 && blue == -1) image_blend = obj_graph.color_defualt;
else if (blue == -1) image_blend = obj_graph.color_highlight_1;
else if (red == -1) image_blend = obj_graph.color_highlight_2;