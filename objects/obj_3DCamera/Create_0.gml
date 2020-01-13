/// @description Camera initialization

// Camera position
x = 0; y = 0; z = 0;

cameraPos = vec3(x, y, z);
cameraFront = vec3(0,0,0);
cameraUp = vec3(0, 0, 1);

cameraSpeed = 4;
cameraZoom = 1;

yaw = -90;
pitch = 45;

smoothSpeed = 0.125;

camera = camera_create();

view_set_camera(0, camera);

camera_set_update_script(view_camera[0], camera_update);