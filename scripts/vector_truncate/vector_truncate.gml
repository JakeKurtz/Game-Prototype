///@function vector_truncate If the vector exceeds the max length, it will be returned truncated to max length.
///@arg v
///@arg len Max length

var v=argument[0];
var len=argument[1];

if(vector_len(v)>len)
    v = vector_scaler(v,len);

return v;