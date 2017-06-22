//argument0 == 2 = oppsing/player2's team
//argument0 == 1 = user/player1's team

/*if(instance_exists(obj_player_test) or instance_exists(obj_player2_test)){
    if(other.release > 8){ //if the ball was just released, don't collide
        if(instance_exists(obj_player_test)){
            if((obj_player_test.x == x) and (obj_player_test.y == y)){
                exit
            }
        }
        if(instance_exists(obj_player2_test)){
            if((obj_player2_test.x == x) and (obj_player2_test.y == y)){
                exit
            }
        }
    }
}*/


if(st_position == 3) and (other.release > 0 or throw_leway > 0) or ch_off_broom or other.throwerid == -1{ //was == -1 05/20/2017 //throwerid = -1 for first frame and changes to 0 second frame. Later changes to the id of the thrower
    /*if(room == rm_tutorial_alt){
        show_message("St_position == " + string(st_position) + "\nrelease = " + string(other.release) + "\nthrow_leway = " + string(throw_leway))
    }*/
    exit //if the ball was just thrown by me, don't catch etc.
}

if(st_position == 3) and (other.throwerid == self) and (other.release > 0 or throw_leway > 0) or ch_off_broom{
    exit
}

drag = 0

if(powerup == 1) and other.friendlyteam != argument0{ //fox powerup that deflects bludgers
    if(instance_exists(obj_fox_powerup) == false){
        instance_create(x, y, obj_fox_powerup)
    }
    if(argument0 == 2){
        other.friendlyteam = 1
    }else{
        other.friendlyteam = 2
    }
    global.throw = st_power
    with other{
        move_towards_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y, global.throw+3)
    }
    exit
}

if(other.powerup == 3) and other.friendlyteam != argument0{ //bludger on a string
    other.powerup3_return = true
    sound_stop(snd_stringstretch)
}else{
    if(st_position == 3) and powerup == 3 and other.powerup == 3 and throw_leway == 0 and ch_ball == false{
        other.x = x
        other.y = y
        other.speed = 0
        sound_stop(snd_stringstretch)
    }
}

//scuffle should be setting ch_ball for the two players scuffling to "false"
if ch_off_broom == false and st_position != 4 and scuffling == true{ //set all non-seekers to not scuffling; there should only be one scuffle.
    scuffling = false;
    tackle = false;
    if(ch_ball == true){
        ch_ball = false;
        show_message("ERROR in scr_bludger_collision. ch_ball shouldn't equal to true.")
        /*if(instance_exists(obj_quaffle) == false){
            scr_throw_ball(obj_bludger, obj_scuffle.x, obj_scuffle.y, 2, 0);
        }*/
    }
    with obj_scuffle{
        //scr_throw_ball(obj_bludger, obj_scuffle.x, obj_scuffle.y, 2, 0);
        instance_destroy()
    }
    
    if(argument0 == 2){ //I am on team2, dummy
        with obj_player_dummy{
            if st_position != 4 and scuffling == true{
                scuffling = false;
                tackle = false;
            }
        }
    
        with obj_player_teammate{ //other player in scuffle should receive ball
            if st_position != 4 and scuffling == true{
                ch_ball = true;
                scuffling = false;
                tackle = false;
            }
        }
    }else{ //I am on team1, user1's team (the player)
        with obj_player_dummy{ //other player in scuffle should receive ball
            if st_position != 4 and scuffling == true{
                ch_ball = true
                scuffling = false;
                tackle = false;
            }
        }
    
        with obj_player_teammate{
            if st_position != 4 and scuffling == true{
                scuffling = false;
                tackle = false;
            }
        }    
    }
    exit
}

if(st_position == 4){
    direction = direction+180
}

if ch_off_broom == false and st_position == 4 and scuffling == true{ //if seeker going for the snitch and beat
    scuffling = false
    with obj_snitch_grab{
    instance_destroy()
    }
    exit
}

if immunitycount > 0 and ((other.speed - st_catching/2) <= 3) == false{ //if immune, just bounce it off
    action_create_object_motion(obj_exclam, x, y, 8, 0);
    with other{
    slow_down = true;
    }
    if random(1) > .5{
        other.hspeed = -1*(other.hspeed)
    }else{
        if random(1) > .5{
            other.vspeed = -1*(other.vspeed)
        }else{
            other.hspeed = -1*(other.hspeed)
            other.vspeed = -1*(other.vspeed)
        }
    }
    scr_bludger_sound()
    exit
}

if(st_position == 3) and (ch_ball == false){ //if beater that is blocking; blocking == kicking
    if((argument0 == 1 and instance_exists(obj_player_test)) or (argument0 == 2 and instance_exists(obj_player2_test))){
        if((argument0 == 1) and blocking){
            if(obj_player_test.blocking){
                global.throw = st_power
                with(other){
                    instance_destroy()
                }
                scr_throw_ball(obj_bludger, x, y, 1, 0) //team 1 kick
                if(other.speed < 3){
                    action_create_object_motion(obj_exclam, x, y, 10, 0); //kick!
                }else{ //potential swat. If beat and projecting movement of bludger, called a "swat"
                    if(other.friendlyteam == 2){
                        action_create_object_motion(obj_exclam, x, y, 12, 0); //swat!
                        ch_off_broom = true;
                    }
                }
            }
        }
        if((argument0 == 2) and blocking){
            if(obj_player2_test.blocking){
                global.throw = st_power
                with(other){
                    instance_destroy()
                }
                scr_throw_ball(obj_bludger, x, y, 4, 0) //team 2 kick
                if(other.speed < 3){
                    action_create_object_motion(obj_exclam, x, y, 10, 0); //kick!
                }else{ //potential beat
                    if(other.friendlyteam == 1){
                        action_create_object_motion(obj_exclam, x, y, 12, 0); //swat!
                        ch_off_broom = true;
                    }
                }
            }
        }
    }
}

if st_position == 3 and ((other.speed - st_catching/2) <= 3) and ch_ball == false and ch_off_broom == false{ //beaters can catch if on broom and have no ball
    ch_ball = true
    with other{
        instance_destroy()
    }
    if other.speed > 1 and other.friendlyteam != argument0
    {
        scr_bludger_sound()
        action_create_object_motion(obj_exclam, x, y, 6, 0); //catch!
        //exit
    }
    exit
}

/*
if st_position == 3 and ((other.speed - st_catching/2) <= 3) and ch_ball == false and ch_off_broom == false{ //beaters can catch if on broom and have no ball
    if other.speed > 1 and other.friendlyteam != argument0 //and id != other.throwerid //throwing bludger initially allows it to be caught since it's "speed" determines what type of throw it is
    {
        ch_ball = true
        with other{
            instance_destroy()
        }
        scr_bludger_sound()
        action_create_object_motion(obj_exclam, x, y, 6, 0); //catch!
        exit
    }
    
    //if from same team as thrower, it shouldn't be catchable until it has been live for a certain amount of time
    //user throwerid?
    
    if other.speed > 1 and other.friendlyteam != argument0 and id == other.throwerid
    {
        if(other.slow_down == true){ //only catch own ball if the ball has hit another player!
            ch_ball = true
            with other{
                instance_destroy()
            }
            scr_bludger_sound()
            action_create_object_motion(obj_exclam, x, y, 6, 0); //catch!            
        }
        exit
    }
}*/

if other.speed > 3 and other.friendlyteam != argument0 and (st_position != 3 or other.release == 0) and ch_off_broom == false{ //2 for dummy, 1 for teammate, 0 for neutral
    with other{
    slow_down = true;
    }
    if blocking == false{ //if player isn't "blocking" (RMB)
        if ch_off_broom == false{ //don't apply beat if I'm already off broom
            with other{
            slow_down = true;
            }
            if random(1) > .5{
                other.hspeed = -1*(other.hspeed)
            }else{
                if random(1) > .5{
                    other.vspeed = -1*(other.vspeed)
                }else{
                    other.hspeed = -1*(other.hspeed)
                    other.vspeed = -1*(other.vspeed)
                }
            }
            scr_bludger_sound()
            ch_off_broom = true
            if(other.speed >= 4){
                action_create_object_motion(obj_exclam, x, y, 3, 0);
            }
            if ch_ball == true{ //if carrying a ball
                ch_ball = false;
                if st_position < 3{ //if a quaffle carrier w/ a quaffle
                    if irandom_range(1, 3) == 1{
                        action_create_object_motion(obj_quaffle, x, y, 2, 0);
                    }else if argument0 == 1{ //player's team
                        with(obj_player_teammate){
                            scr_check_eligible_pass() //This is the correct script! "teammate" is for dummy; I know, it's confusing but there's too much built off of this
                        }
    
                        if (obj_player_teammate.x == global.targetX) and (obj_player_teammate.y  == global.targetY){
                            action_create_object_motion(obj_quaffle, x, y, 7, 0)
                            ch_ball = false
                            //show_message("Pass")
                            exit
                        }else{
                            action_create_object_motion(obj_quaffle, x, y, 2, 0);
                        }
                        advancechoice = 0                    
                    }else if argument0 == 2{ //opposing team
                        with(obj_player_dummy){
                            scr_check_eligible_dummy()
                        }
    
                        if (obj_player_dummy.x == global.targetX) and (obj_player_dummy.y  == global.targetY){
                            action_create_object_motion(obj_quaffle, x, y, 7, 0)
                            ch_ball = false
                            //show_message("Pass")
                            exit
                        }else{
                            action_create_object_motion(obj_quaffle, x, y, 2, 0);
                        }
                        advancechoice = 0                    
                    }else{
                        action_create_object_motion(obj_quaffle, x, y, 2, 0);
                    }
                }
                if st_position == 3{
                    scr_throw_ball(obj_bludger, x, y, 2, 0);
                }
            }
        }
    }
    if blocking == true{ //if player is blocking (RMB)
        scr_bludger_sound()
        if ch_ball != true{
            global.throw = st_power
            if argument0 == 2{
                scr_throw_ball(obj_bludger, x, y, 6, 0) //random direction
            }
            if argument0 == 1{
                scr_throw_ball(obj_bludger, x, y, 15, 0) //random direction, WRONG
            }
            with other{
                instance_destroy()
            }
            ch_off_broom = true;
            if(other.speed >= 4){
                action_create_object_motion(obj_exclam, x, y, 3, 0); //BEAT!
            }
            //swatting a bludger, yellow card?
        }else{ //if ch_ball == true
            blocking = false
            if (random(st_luck+3)+(st_accuracy/2) > 5) and self.direction-other.direction >= 90{
                if random(st_luck+3) + st_grip/2 > 5{
                    global.throw = st_power/2
                    with other{
                        move_bounce_all(false); //bounce not precisely?
                    }
                    action_create_object_motion(obj_exclam, x, y, 2, 0); //BLOCK!
                }else{
                    global.throw = (st_power/2)
                    if st_position < 3{
                        action_create_object_motion(obj_quaffle, x, y, 2, 0);
                    }else{
                        scr_throw_ball(obj_bludger, x, y, 2, 0); //BLOCK!
                    }
                    ch_ball = false;
                    with other{
                    slow_down = true;
                    }
                    if random(1) > .5{
                        other.hspeed = -1*(other.hspeed)
                    }
                    else{
                        if random(1) > .5{
                            other.vspeed = -1*(other.vspeed)
                        }else{
                            other.hspeed = -1*(other.hspeed)
                            other.vspeed = -1*(other.vspeed)
                        }
                    }
                }
            }else{
                ch_ball = false
                if st_position < 3{
                    action_create_object_motion(obj_quaffle, x, y, 2, 0);
                }else{
                    scr_throw_ball(obj_bludger, x, y, 2, 0); //random direction, no friendlyteam
                }
                if(other.speed >= 4){
                    action_create_object_motion(obj_exclam, x, y, 3, 0);
                }
                ch_off_broom = true;
            }
        }
    }
}

if argument0 == 2{
instance_create(x, y, obj_team2bludgerwaypoint)
}

if argument0 == 1{
instance_create(x, y, obj_team1bludgerwaypoint)
}

if st_position == 3 and ch_ball == true{
    immunitycount = 0;
    ch_immunity = false
}
