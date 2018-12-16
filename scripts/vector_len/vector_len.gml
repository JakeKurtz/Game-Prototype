/*
-- Returns the length of a scalar 
-- @ param v1
-- @ return tot
*/

var v1 = argument0;

var num = v1[0];
var tot = 0;
for(var i = 1; i <= num; i++) {
    tot+=v1[i]*v1[i];
}
if(tot != 0) {
    tot = sqrt(tot);
}
return tot;