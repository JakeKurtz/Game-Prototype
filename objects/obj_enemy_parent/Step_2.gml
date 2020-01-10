/// @description Update State

//hurtbox

/// the following is from: https://developer.amazon.com/blogs/appstore/post/cc08d63b-2b7c-4dee-abb4-272b834d7c3a/gamemaker-basics-hitboxes-and-hurtboxes
with(hurtbox){
    x = other.x + xOffset;
    y = other.y + yOffset;
}

if(hitbox != -1){
    with(hitbox){
        x = other.x + xOffset;
        y = other.y + yOffset;

        //check to see if the hurtbox is touching your hitbox        
        with(obj_hurtbox){
            if(place_meeting(x,y,other) && other.owner != owner){
                //ignore check
                //checking collision from the hitbox object
                with(other){
                    //check to see if your target is on the ignore list
                    //if it's on the ignore list, dont hit it again
                    for(i = 0; i < ds_list_size(ignore_list); i ++){
                        if(ignore_list[|i] = other.owner){
                            ignore = true;
                            break;
                        }
                    }

                    //if it's NOT on the ignore list, hit it, and add it to the ignore list
                    if(!ignore){
                        other.owner.hit = true;
                        other.owner.hitBy = id;
                        ds_list_add(ignore_list, other.owner);
                    }
                }
            }
        }
    }
}

state_update();