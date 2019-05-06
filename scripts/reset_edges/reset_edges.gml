///@function 
///@arg array

var arr = argument[0];
var color_value = argument[1];

for(var i = 0; i < array_length_2d(arr, 0); i++){
  for(var j = 0; j < array_length_2d(arr, 0); j ++){
    if (arr[i,j] == color_value) arr[i,j] = 1;
  }
}
return arr;