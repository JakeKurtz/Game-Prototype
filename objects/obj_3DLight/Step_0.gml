/// @description Insert description here
// You can write your code in this editor

lightPos[0] = mouse_x;//cos(current_time);
lightPos[1] = mouse_y;//sin(current_time);

//lightPos = matrix_vector_mul(matrix_build(0,0,0,0,0,0.25,1,1,1), lightPos);

lightSpaceView = matrix_build_lookat(lightPos[0], lightPos[1], lightPos[2], shadow_x, shadow_y, 0, 0, 0, 1);
lightSpaceMatrix = matrix_multiply(lightSpaceView, lightSpaceProjection);
