/// @description which side of a line is the point on.
/// @function sign_test
/// @arg Ax 
/// @arg Ay 
/// @arg Bx
/// @arg By
/// @arg Lx
/// @arg Ly

var _Ax = argument0;
var _Ay = argument1;
var _Bx = argument2;
var _By = argument3;
var _Lx = argument4;
var _Ly = argument5;

return ((_Bx - _Ax) * (_Ly - _Ay) - (_By - _Ay) * (_Lx - _Ax));