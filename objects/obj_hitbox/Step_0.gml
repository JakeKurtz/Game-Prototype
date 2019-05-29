/// @description Insert description here
// You can write your code in this editor

//image_xscale *= sign(owner.image_xscale);
//xOffset *= sign(owner.image_xscale);
//xHit *= sign(owner.image_xscale);

life--;

if(life <= 0){
    instance_destroy();
}