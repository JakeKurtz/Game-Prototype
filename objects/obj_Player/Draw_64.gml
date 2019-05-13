/// @description For debugging
// You can write your code in this editor
/*
draw_text(20,20,string_hash_to_newline("State: "+string(state_name)
			  +"#Health: "+string(_health)
              +"#x_speed: "+string(velocity[1])
			  +"#y_speed: "+string(velocity[2]))
         );
		 
		 /// @description For debugging
// You can write your code in this editor
*/
with(obj_enemy_parent) {
draw_text(view_get_xport(view_current)+20,view_get_yport(view_current)+20,string_hash_to_newline("State: "+string(state_name)
			  +"#Health: "+string(_health)
			  +"#x velocity: "+string(velocity[1])
			  +"#y velocity: "+string(velocity[2]))
         );
}

//draw_set_alpha(0.3);
//mp_grid_draw(global.grid);
//draw_set_alpha(1);