/// @description

y+=z;
draw_self();
y-=z;

// shadow size determined by the height of the object in the air
var xscale = (sprite_width*0.55)/abs(z*.02);
var yscale = (sprite_height*0.3)/abs(z*.02);

xscale = clamp(xscale,0,sprite_width*0.55);
yscale = clamp(yscale,0,sprite_height*0.3);

if (shadow) draw_shadow(xscale,yscale,0,3,0.75);