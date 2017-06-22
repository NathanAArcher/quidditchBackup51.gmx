//places quaffle in last known location when unexpectedly deleted
//also takes care of extra bludgers that show up randomly

if(room != rm_alt and room != rm_test){
    exit
}

global.bludgercount = 0

if(instance_exists(obj_bludger)){
    with obj_player_teammate{ //if either 
        if(ch_ball == true) and (st_position == 3){
            global.bludgercount += 1
        }
    }
    with obj_player_teammate{ //if either 
        if(ch_ball == true) and (st_position == 3){
            global.bludgercount += 1
        }
    }
    with obj_bludger{
        global.bludgercount += 1
    }
}

if(instance_exists(obj_quaffle) == false) and instance_exists(obj_scuffle) == false{ //neither player should have the ball if it's a scuffle
    if(scr_any_players_have_quaffle() != true){
        if(global.debugmode == true){
            show_message("Quaffle failsafe activated")
        }
        action_create_object_motion(obj_quaffle, global.ballX, global.ballY, 2, 0)
        if(global.bludgercount >= 5){ //there exist some instances where there appear to be 4 bludgers but there are actually 3
            if((instance_nearest(global.ballX, global.ballY, obj_bludger).x - global.ballX) < 16 and (instance_nearest(global.ballX, global.ballY, obj_bludger).y - global.ballY) < 16){
                with (instance_nearest(global.ballX, global.ballY, obj_bludger)){
                    instance_destroy()
                    global.bludgercount -= 1
                    if(global.debugmode == true){
                        show_message("Bludgercount = " + string(global.bludgercount) + "; Bludger replaced with quaffle")
                    }
                }
            }
        }
    }
}

/*if(global.bludgercount >= 5){ //there exist some instances where there appear to be 4 bludgers but there are actually 3
    if((instance_nearest(global.ballX, global.ballY, obj_bludger).x - global.ballX) < 16 and (instance_nearest(global.ballX, global.ballY, obj_bludger).y - global.ballY) < 16){
        with (instance_nearest(global.ballX, global.ballY, obj_bludger)){
            instance_destroy()
            global.bludgercount -= 1
            show_message("Fourth bludger deleted anyway")
        }
    }
}*/
