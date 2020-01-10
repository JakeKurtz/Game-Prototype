var filename = argument0;
var obj_file = file_text_open_read(filename);

vertex_format_begin();

vertex_format_add_position_3d();	//Add 3D position info
vertex_format_add_normal();
vertex_format_add_color();			//Add color info
vertex_format_add_texcoord();		//Texture coordinate info

format = vertex_format_end();

var model = vertex_create_buffer();
vertex_begin(model, format);

var v_x = ds_list_create();
var v_y = ds_list_create();
var v_z = ds_list_create();

var vt_u = ds_list_create();
var vt_v = ds_list_create();

var vn_x = ds_list_create();
var vn_y = ds_list_create();
var vn_z = ds_list_create();

while (!file_text_eof(obj_file)) {
	var line = file_text_read_string(obj_file);
	file_text_readln(obj_file);
	
	var terms, index;
	index = 0
	terms[string_count(line, " ")]="";
	for (var i = 1; i <= string_length(line); i++) {
		if (string_char_at(line, i) == " ") {
			index++;
			terms[index] = "";
		} else {
			terms[index] = terms[index] + string_char_at(line, i);	
		}
	}
	switch(terms[0]) {
		case "v":
			ds_list_add(v_x, real(terms[1]));
			ds_list_add(v_y, real(terms[2]));
			ds_list_add(v_z, real(terms[3]));
			break;
		case "vt":
			ds_list_add(vt_u, real(terms[1]));
			ds_list_add(vt_v, real(terms[2]));
			break;
		case "vn":
			ds_list_add(vn_x, real(terms[1]));
			ds_list_add(vn_y, real(terms[2]));
			ds_list_add(vn_z, real(terms[3]));
			break;
		case "f":
			for (var n = 1; n <= 3; n++) {
				
				var data, index;
				index = 0;
				data[0] = "";
				data[string_count(terms[n], "/")] = "";
				
				for (var i = 1; i <= string_length(terms[n]); i++) {
					if (string_char_at(terms[n], i) == "/") {
						index++;
						data[index] = "";
					} else {
						data[index] = data[index] + string_char_at(terms[n], i);	
					}
				}
				
				var xx = ds_list_find_value(v_x, real(data[0]) - 1);
				var yy = ds_list_find_value(v_y, real(data[0]) - 1);
				var zz = ds_list_find_value(v_z, real(data[0]) - 1);
				
				var u = ds_list_find_value(vt_u, real(data[1]) - 1);
				var v = ds_list_find_value(vt_v, real(data[1]) - 1);
				
				var nx = ds_list_find_value(vn_x, real(data[2]) - 1);
				var ny = ds_list_find_value(vn_y, real(data[2]) - 1);
				var nz = ds_list_find_value(vn_z, real(data[2]) - 1);

				vertex_position_3d(model, xx, yy, zz);
				vertex_normal(model, nx, ny, nz);
				vertex_color(model, c_white, 1);
				vertex_texcoord(model, u, v);
			}
			break;
	}
}

vertex_end(model);

ds_list_destroy(v_x);
ds_list_destroy(v_y);
ds_list_destroy(v_z);

ds_list_destroy(vt_u);
ds_list_destroy(vt_v);

ds_list_destroy(vn_x);
ds_list_destroy(vn_y);
ds_list_destroy(vn_z);

file_text_close(obj_file);

return model;