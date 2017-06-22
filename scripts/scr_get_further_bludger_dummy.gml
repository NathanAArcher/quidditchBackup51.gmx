//argument0 = my x coordinate
//argument1 = my y coordinate
//argument2 = x or y

/*WARNING: Will return a random bludger if 2 bludgers on ground*/

with(obj_bludger){
    if((instance_nearest(x, y, obj_player_dummy).x == argument0) and (instance_nearest(x, y, obj_player_dummy).y == argument1)){ //if I am the closest bludger to the teammate
        //no
    }else{ //i am a further bludger
        if(argument2 == "x"){
            return x;
        }else{
            return y;   
        }
    }
}
