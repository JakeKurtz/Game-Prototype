/// @description array(*args);
/// @param *args
// Just a script that makes declaring arrays nicer
var arr;
for (var i=0;i<argument_count;i+=1)
{
    arr[i] = argument[i];
}
return arr;
