/// @description

y+=z;
draw_self();
y-=z;

// shadow size determined by the height of the object in the air
var xscale = (sprite_width*.2)/abs(z*.05);
var yscale = (sprite_height*.1)/abs(z*.05);

xscale = clamp(xscale,0,sprite_width*0.2);
yscale = clamp(yscale,0,sprite_height*0.1);

if (shadow) draw_shadow(xscale,yscale,0,3,0.75);