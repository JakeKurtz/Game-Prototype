/// @description Insert description here
// You can write your code in this editor

lightPos[0] = mouse_x;//cos(current_time);
lightPos[1] = mouse_y;//sin(current_time);

shadow_viewMatrix = matrix_build_lookat(lightPos[0], lightPos[1], lightPos[2], shadow_x, shadow_y, 0, 0, 0, 1);
lightSpaceMatrix = matrix_multiply(shadow_viewMatrix, shadow_projectionMatrix);
