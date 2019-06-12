//DOES: draws the lightmap to the screen

//USAGE: lightmap_draw();

//set the blend mode to multiply
gpu_set_blendmode_ext(bm_dest_color,bm_zero);

//draw the surface to the screen
if(lightmap_move){
    draw_surface(lightmap_surface_id,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ));
}else{
    draw_surface(lightmap_surface_id,x,y);
}

//reset blend mode to normal (this CAN cause bugs, further explination below)
gpu_set_blendmode(bm_normal);

//EXPLAINATION:
/*
It is possible that if you where drawing with a certain blend mode (e.a. bm_add)
and you use this function half way through, it will set the blend mode to normal 
again. You will have to reset it to bm_add. 

*/
