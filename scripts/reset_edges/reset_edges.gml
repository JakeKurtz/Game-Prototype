///@function 
///@arg array

var arr = argument[0]
for(var i = 0; i < array_length_2d(arr, 0); i++){
  for(var j = 0; j < array_length_2d(arr, 0); j ++){
    if (arr[i, j] == 2) arr[i,j] = 1;
  }
}
return arr;