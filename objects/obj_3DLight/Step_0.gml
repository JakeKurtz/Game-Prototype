/// @description Insert description here
// You can write your code in this editor

//lightPos[0] = -200;//mouse_x;//cos(current_time);
//lightPos[1] = 600;//mouse_y;//sin(current_time);

if keyboard_check(ord("F")) lightPos[0] += 10;
if keyboard_check(ord("H")) lightPos[0] -= 10;

if keyboard_check(ord("T")) lightPos[1] += 10;
if keyboard_check(ord("G")) lightPos[1] -= 10;

show_debug_message("x: " + string(mouse_x));
show_debug_message("y: " + string(mouse_y)+"\n");

//lightPos = matrix_vector_mul(matrix_build(0,0,0,0,0,0.25,1,1,1), lightPos);

lightSpaceView = matrix_build_lookat(lightPos[0], lightPos[1], lightPos[2], shadow_x, shadow_y, 0, 0, 0, 1);
lightSpaceMatrix = matrix_multiply(lightSpaceView, lightSpaceProjection);
