/*
-- If the vector exceeds the max length, it will be returned truncated to max length.
-- @ param v1 
-- @ param len Max length
-- @ return v 
*/

var v=argument[0];
var len=argument[1];

if(vector_len(v)>len)
    v = vector_scaler(v,len);

return v;