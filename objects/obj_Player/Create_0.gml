
//Init movement variables
hsp = 0;
vsp = 0;

atk_type = "";
combo_stream = "";

move_spd = 10;
spd = move_spd;
dash_spd = 25;

facing = 0;

attack = false;
dash = false;
WASD_enabled = true;

image_spd = 1;
image_speed = image_spd;

wait_sec = 0;
wait = false;

alarm[0] = 15;

command_list = ds_list_create(); // used for combos
