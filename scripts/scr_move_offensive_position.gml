//allows player to move AROUND the hoops to avoid potentially running into beaters

//argument0 = x
//argument1 = y
//argument2 = speed

exitScript = false //we don't want the player to exit their code ENTIRELY, just leave the script

if(instance_nearest(global.ballX, global.ballY, obj_player_teammate).x == x and instance_nearest(global.ballX, global.ballY, obj_player_teammate).y == y){
    //exit
    exitScript = true
}
if(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x == x and instance_nearest(global.ballX, global.ballY, obj_player_dummy).y == y){
    //exit
    exitScript = true
}

if instance_exists(obj_passmarker){ //if pass to me, disregard all else
            if distance_to_point(obj_passmarker.x, obj_passmarker.y) < 48{
                thoughts = "there is a pass near me"
                exitScript = true         
            }
}

if(exitScript == false){

    if global.threedmode == false{
        if (po_ox > 224 and po_ox < 384){ //Moving within range of hoops
            move_towards_point(argument0, argument1, argument2) //if not behind hoops, just move towards position
            if ((po_oy > 0 and po_oy < 192)){ //Moving behind TOP hoops
                if (po_ox > 304){ //to the right of center
                    if (y > 184){
                        move_towards_point(448, 176, argument2) //move to right side of hoops
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }else{            //to the left of center
                    if (y > 184){
                        move_towards_point(176, 176, argument2) //move to left side of hoops
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }
            }
        }else
            if (po_oy > 560 and po_oy < 750){ //Moving behind BOTTOM hoops
                if (po_ox > 304){ //to the right of center
                    if (y < 552){
                        move_towards_point(448, 560, argument2) //move to right side of hoops
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }else{            //to the left of center
                    if (y < 552){
                        move_towards_point(176, 560, argument2) //move to left side of hoops
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }        
            }else{
                move_towards_point(argument0, argument1, argument2)
            }
    }else{ //3-D MODE!
        if (po_oy > 400 and po_oy < 584){ //Moving within range of hoops
            move_towards_point(argument0, argument1, argument2) //if not behind hoops, just move towards position
            thoughts = "Just go to offensive position"
            if ((po_ox > 0 and po_ox < 672)){ //Moving behind LEFT hoops
                thoughts = "Move behind LEFT hoops"
                if (po_oy > 492){ //to the bottom of center
                    if (x > 640){
                        if abs(y - 624) > 4{
                            move_towards_point(632, 624, argument2) //move to BOTTOM side of hoops
                        }else{
                            move_towards_point(x-4, y, argument2) 
                        }
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }else{            //to the left of center
                    if (x > 704){
                        if abs(y - 696) > 4{
                            move_towards_point(696, 328, argument2) //move to TOP side of hoops
                        }else{
                            move_towards_point(x-4, y, argument2) 
                        }
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }
            }
        }else{
            if (po_ox > 1264 and po_ox < 1920){ //Moving behind RIGHT hoops
                thoughts = "Move behind RIGHT hoops"
                if (po_oy > 492){ //to the right of center
                    if (x < 1272){
                        if abs(y - 624) > 4{
                            move_towards_point(1280, 624, argument2) //move to BOTTOM side of hoops
                        }else{
                            move_towards_point(x+4, y, argument2)
                        }
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }else{            //to the left of center
                    if (x < 1208){
                        if abs(y - 696) > 4{
                            move_towards_point(1216, 328, argument2) //move to TOP side of hoops
                        }else{
                            move_towards_point(x+4, y, argument2)
                        }
                    }else{
                        move_towards_point(argument0, argument1, argument2)
                    }
                }        
            }else{
                move_towards_point(argument0, argument1, argument2)
            }
        }
    }

}
