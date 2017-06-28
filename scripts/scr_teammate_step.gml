//Brooms up: 52
//Quaffle free: 95
//Defense: 211
//Offense: 351 (ball carrier); 540 (beater)
//Own keeper recover: 617
//Opposing keeper recover: 684

if(manfound == false and instance_exists(obj_player_dummy)){
    scr_find_man()
    manfound = true
}

if(abs((prev_direction+360) - (twoback_direction+360)) < 90) and (abs((direction+360) - (prev_direction+360)) < 90){ //prevents vibration
    /*draw_direction = direction
    draw_direction = (prev_direction + twoback_direction + direction)/3*/
    draw_direction = direction
    draw_direction = (twoback_direction + prev_direction*2 + direction*3)/6 //makes motion look more fluid
    if(instance_exists(obj_player_test)){
        if(blocking == true) and (obj_player_test.x != x or obj_player_test.y != y){
            if(instance_exists(obj_bludger)){
                move_towards_point(obj_bludger.x, obj_bludger.y-12, 0) //just to change direction; should be overriden later after draw_direction is established
                draw_direction = direction;
            }
        }
    }
}

if(st_position != 4 or ch_off_broom == true or powerup == 5){
    if(direction < 90) and (truedirection > 270){
        truedirection += 15
    }else if (direction > 270) and (truedirection < 90){
        truedirection -= 15
    }
    else if(abs(direction - truedirection) >= 20){
        if (abs((truedirection + 15) - direction)) mod 360 < (abs((truedirection - 15) - direction)) mod 360{
            truedirection += 15
        }else{
            truedirection -= 15
        }
    }
    if(abs(direction - truedirection) < 20){
        truedirection = direction
    }
    if(truedirection > 360){
        truedirection = truedirection - 360
    }
    if(truedirection < 0){
        truedirection = truedirection + 360
    }
}

if(contact_direction == -1){
    draw_direction = truedirection
}else{
    draw_direction = contact_direction
}
twoback_direction = prev_direction
prev_direction = direction
    
if global.threedmode == true{
    if defense == 0{
        if st_position == 1{
            if manStrategy == 0{
                po_dx = po_chaser_zone
                po_dy = global.ballY
            }
            if manStrategy == 1 or manStrategy == 2{
                if man.x < room_width/2+32{
                    po_dx = man.x
                    po_dy = man.y
                }else{
                    po_dx = po_dhardx
                    po_dy = man.y
                }
            }
        }
    }
}else{
    if defense == 0{
        if st_position == 1{
            if manStrategy == 0{
                po_dx = global.ballX
                po_dy = po_chaser_zone
            }
            if manStrategy == 1 or manStrategy == 2{
                if man.y > room_height/2-32{
                    po_dx = man.x
                    po_dy = man.y
                }else{
                    po_dx = man.x
                    po_dy = po_dhardy
                }
            }
        }
    }    
}

if st_energy > 1{
    moving_speed = 2+(st_speed*.1)+sprint
}else{
    moving_speed = 2+(st_speed*.1)
}

if global.threedmode == true{
    if st_energy > 1{
        moving_speed = (2+(st_speed*.1)+sprint)*(.85+(y/480)*.25) + drag
    }else{
        moving_speed = (2+(st_speed*.1))*(.85+(y/480)*.25) + drag
    }
}

if tackle == false and scuffling == false{
    depth = -y
}else{
    depth = -y+32
}

if st_energy < st_stamina*100{
    st_energy = st_energy+1
}
if throw_leway > 0{
    throw_leway = throw_leway-1
}
if dive_cooldown > 0{
    dive_cooldown = dive_cooldown-1
}

if ch_tackle_immunity > 0{
    ch_tackle_immunity = ch_tackle_immunity-1
}

if room != rm_pitch and room != rm_alt and room != rm_test and room != rm_online_pitch and room != rm_tutorial_alt{
    exit
}

/*if instance_exists(obj_player_test){
    if obj_player_test.x == x and obj_player_test.y == y{
    exit
    }
}*/

if(room == rm_prepitch or room == rm_prepitch_alt){
    image_speed = 0
}

if ch_ball == true and st_position < 3{
    global.ballX = x
    global.ballY = y
    global.possession = 1
}
if st_position == 4{
    global.seeker1x = x
    global.seeker1y = y
}

if st_position == 2{ //I think this is old, ch_immunity isn't used. The var "immunity" is.
    if y > 496
    {
    ch_immunity = true;
    }else{
    ch_immunity = false;
    }
}
if(st_position == 2){ //keeper in keeper zone
    if(global.threedmode == false){
        if(y < 480){
            immunitycount = 0
        }
    }else{
        if(x > 764){
            immunitycount = 0
        }
    }
    
    if(global.threedmode){
        if(x < 764){
            immunitycount = 2
        }
    }else{
        if(y > 480){
            immunitycount = 2
        }
    }
}

if(st_position == 4){
    if(instance_exists(obj_seekeryeti)){ //easter egg/powerup
        if (distance_to_object(obj_seekeryeti) < 16){
            speed = 0
            image_speed = obj_seekeryeti.image_speed
            exit
        }
    }
}

if tackle == false and scuffling == false and ch_off_broom == false and stiffarmed == false and drag < 1 and (argument0 == 0){
    if st_position == 4{ //if seeker; disregard all quaffle play
        if(powerup == 5){
            thoughts = "Sub out for yeti"
            sprint = 1
            move_towards_point(-32, -32, moving_speed)
            if(distance_to_point(-32, -32) < 8){
                instance_change(obj_seekeryeti, false)
            }
            exit
        }
        if global.team1_score - global.team2_score >= -30{
            thoughts = "Go for the snitch";
            blocking = true
            //global.team2onseeker = 1
            if distance_to_point(obj_snitch.x, obj_snitch.y) > 8{
                move_towards_point(obj_snitch.x, obj_snitch.y, moving_speed)
            }
            /*if distance_to_object(obj_player_test) < 16{
                mp_potential_step(obj_snitch.x, obj_snitch.y, moving_speed, true)
                }*/
            if distance_to_object(obj_snitch) < 64{
                sprint = true
                }
            else{
                sprint = false
                }
        }else{
            thoughts = "Defensive seek"
            blocking = true
            if(distance_to_point(global.seeker2x, global.seeker2y) < distance_to_point(obj_snitch.x, obj_snitch.y)){
                draw_direction = obj_snitch.direction;
            }
            //global.team2onseeker = 0
            if distance_to_point((global.seeker2x + obj_snitch.x*2)/3, (global.seeker2y + obj_snitch.y*2)/3) > 4{
                if distance_to_point((global.seeker2x + obj_snitch.x*2)/3, (global.seeker2y + obj_snitch.y*2)/3) > 16{
                    move_towards_point((global.seeker2x + obj_snitch.x*2)/3, (global.seeker2y + obj_snitch.y*2)/3, moving_speed)
                }else{
                    move_towards_point((global.seeker2x + obj_snitch.x*2)/3, (global.seeker2y + obj_snitch.y*2)/3, moving_speed-1)
                    if(ch_off_broom == false){
                        direction = direction+180
                        speed = -1*(moving_speed-1) //make them face the other way?
                    }
                }
            }else{
                move_towards_point(global.seeker2x, global.seeker2y, 0)
            }
        }
        if(abs(direction - truedirection) >= 20){
            if (abs((truedirection + 15) - direction)) mod 360 < (abs((truedirection - 15) - direction)) mod 360{
                truedirection += 15
            }else{
                truedirection -= 15
            }
        }
    }
    if global.possession == -1{ //if brooms up
        if st_position < 3{
            if go_broomsup == 0{
                if st_position != 2{
                    if distance_to_point(po_dx, po_dy) > 6{
                        move_towards_point(po_dx, po_dy, moving_speed)
                        thoughts = "Move to defensive position"
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                        thoughts = "Maintain defensive position " + string(po_dx) + ", " + string(po_dy)
                    }
                }else{
                    if (global.threedmode == false and distance_to_point(obj_center_opp.x, obj_center_opp.y - po_keeper_distance) > 4) or (global.threedmode == true and distance_to_point(obj_center_opp.x + po_keeper_distance, obj_center_opp.y) > 4){
                        if global.threedmode == false{
                            move_towards_point(obj_center_opp.x, obj_center_opp.y - po_keeper_distance, moving_speed)
                        }else{
                            move_towards_point(obj_center_opp.x + po_keeper_distance, obj_center_opp.y, moving_speed)
                        }
                        thoughts = "Move to defensive position"
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                        thoughts = "Maintain defensive position " + string(obj_center_opp.x) + ", " + string(obj_center_opp.y-po_keeper_distance)
                    }
                }
            }
            if go_broomsup == 1{
                sprint = 1
                move_towards_point(global.ballX, global.ballY, moving_speed)
                thoughts = "BU; Go for quaffle"
            }
            if go_broomsup == 2{
                move_towards_point(po_ox, po_oy, moving_speed)
                sprint = 1
                //scr_move_offensive_position(po_ox, po_oy, moving_speed) //move_towards_point(po_ox, po_oy, moving_speed)
                thoughts = "BU; Move to offensive position"
            }
        }
            if st_position == 3{
                sprint = 1
                if ch_ball == false and instance_exists(obj_bludger){
                    //basic attain bludger command, will be overridden if there are two bludgers
                    move_towards_point(instance_nearest(x, y, obj_bludger).x, instance_nearest(x, y, obj_bludger).y, moving_speed)
                    thoughts = "Attain bludger"
                    if(instance_number(obj_bludger) != 2){ //if 1 or 3 go to closest bludger
                        move_towards_point(instance_nearest(x, y, obj_bludger).x, instance_nearest(x, y, obj_bludger).y, moving_speed)
                        thoughts = "Attain closest bludger"
                    }else{ //if two bludgers on ground
                        //if I am closest to the further bludger and my beater buddy is reasonably close
                        if(scr_beater_teammate_is_bludgerless() and distance_to_point(scr_beater_teammate_nearest_me(x, y, "x"), scr_beater_teammate_nearest_me(x, y, "y") < 96)){ //if neither beaters have bludgers
                            //get_further_bludger_teammate returns a bludger's coordinates
                            if(instance_nearest((scr_get_further_bludger_teammate(x, y, "x")), ((scr_get_further_bludger_teammate(x, y, "y"))), obj_player_teammate).x == x
                            and instance_nearest((scr_get_further_bludger_teammate(x, y, "x")), ((scr_get_further_bludger_teammate(x, y, "y"))), obj_player_teammate).y == y){ //if I am closest teammate to further bludger
                                move_towards_point(scr_get_further_bludger_teammate(x, y, "x"), scr_get_further_bludger_teammate(x, y, "y"), moving_speed) //move towards further bludger
                                thoughts = "Attain further bludger"
                                //may cause them to get caught in between
                            }
                        }
                    }
                }else{
                move_towards_point(po_dx, po_dy, moving_speed)
                    thoughts = "Move to defensive position"
                }
            }
    
        }
    if global.possession == 0{ //if quaffle free; if this causes an error scuffle does not do possesssion correctly
        if instance_exists(obj_quaffle){
            if st_position == 1{ //chaser (can use quaffle, doesn't have keeper privileges)
                if (scr_chaser_teammate_closest_quaffle("x") == x) and (scr_chaser_teammate_closest_quaffle("y") == y){ //should incorporate obj_player_test for other
                    if(abs(obj_quaffle.x - instance_nearest(obj_quaffle.x, obj_quaffle.y, obj_player_teammate).x)
                    + abs(obj_quaffle.y - instance_nearest(obj_quaffle.x, obj_quaffle.y, obj_player_teammate).y)) -
                    (abs(obj_quaffle.x - instance_nearest(obj_quaffle.x, obj_quaffle.y, obj_player_dummy).x) //also do obj_player_test
                    + abs(obj_quaffle.y - instance_nearest(obj_quaffle.x, obj_quaffle.y, obj_player_dummy).y)) < 32{ // if chance of getting it before opposing player
                        thoughts = "I am closest. Sprint on quaffle"
                        sprint = 1
                        move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
                    }else{
                        thoughts = "Too far to get to it. Return"
                        if distance_to_point(po_dx, po_dy) > 4{
                            move_towards_point(po_dx, po_dy, moving_speed)
                        }else{
                            thoughts = "Too far. Return. Stare."
                            move_towards_point(global.ballX, global.ballY, 0)
                        }
                    }
                }else{
                    if scr_team1_is_closest() == false and ((global.threedmode == false and global.ballY < room_height/2) or (global.threedmode == true and global.ballX > room_width/2)){
                        if distance_to_point(po_dx, po_dy) > 4{
                            move_towards_point(po_dx, po_dy, moving_speed)
                            thoughts = "Opposing team is closer; retreat"
                        }else{
                            move_towards_point(global.ballX, global.ballY, 0)
                            thoughts = "At def; stare at ball"
                        }
                    }else{
                        if distance_to_point(po_ox, po_oy) > 16{
                            thoughts = "Our team is closer; offensive position"
                            scr_move_offensive_position(po_ox, po_oy, moving_speed) //move_towards_point(po_ox, po_oy, moving_speed)
                        }else{
                            move_towards_point(global.ballX, global.ballY, 0)
                            direction = point_direction(x,y,global.ballX,global.ballY) //patch, above line doesn't appear to work!
                            thoughts = "At offensive position, stare at ball"
                            if(scr_chaser_teammate_closest_quaffle("x") == x and scr_chaser_teammate_closest_quaffle("y") == y){
                                move_towards_point(global.ballX, global.ballY, moving_speed)
                                sprint = 1
                                thoughts = "I am closest, move on quaffle!!"
                            }
                        }
                    }
                }
            }
        if st_position == 2{ //keeper, like a chaser but can DIVE in keeper zone
            if (global.threedmode == false and global.ballY < obj_center_opp.y and y > obj_center_opp.y + po_keeper_distance) or (global.threedmode == true and global.ballX > obj_center_opp.x and x < obj_center_opp.x - po_keeper_distance){
                thoughts = "Move behind hoops"
                if (global.threedmode == false and distance_to_point(obj_center_opp.x, obj_center_opp.y + po_keeper_distance) > 4) or (global.threedmode == true and distance_to_point(obj_center_opp.x - po_keeper_distance, obj_center_opp.y) > 4){
                    if global.threedmode == false{
                        move_towards_point(obj_center_opp.x, obj_center_opp.y + po_keeper_distance, moving_speed)
                    }else{
                        move_towards_point(obj_center_opp.x - po_keeper_distance, obj_center_opp.y, moving_speed)
                    }
                }else{
                    move_towards_point(global.ballX, global.ballY, 0)
                    thoughts = "Behind; stare at ball"
                }
            }
            if (global.threedmode == false and global.ballY > obj_center_opp.y and y < obj_center_opp.y - po_keeper_distance) or (global.threedmode == true and global.ballX < obj_center_opp.x and x > obj_center_opp.x + po_keeper_distance){
                thoughts = "Move in front of hoops"
                if (global.threedmode == false and distance_to_point(obj_center_opp.x, obj_center_opp.y - po_keeper_distance) > 4) or (global.threedmode == true and distance_to_point(obj_center_opp.x + po_keeper_distance, obj_center_opp.y)){
                    if global.threedmode == false{
                        move_towards_point(obj_center_opp.x, obj_center_opp.y - po_keeper_distance, moving_speed)
                    }else{
                        move_towards_point(obj_center_opp.x + po_keeper_distance, obj_center_opp.y, moving_speed)
                    }
                }else{
                    move_towards_point(global.ballX, global.ballY, 0)
                thoughts = "In front of; stare at ball"
                }
            }
            if abs(((instance_nearest(obj_quaffle.x, obj_quaffle.y, obj_player_dummy).x - obj_quaffle.x)) + abs((instance_nearest(obj_quaffle.x, obj_quaffle.y, obj_player_dummy).x - obj_quaffle.x)) + 32) < (abs(x - obj_quaffle.x) + abs(y - obj_quaffle.y)){
                //if closer than opponent by 32
                thoughts = "Closer than opponents; move quaffle";
                move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
                }
            
        if (distance_to_object(obj_center_opp) > (po_keeper_distance + 8) and distance_to_object(obj_baby_opp) > (po_keeper_distance + 8) and distance_to_object(obj_smedium_opp) > (po_keeper_distance + 8)){
            thoughts = "Far enough; move quaffle" + string(distance_to_object(obj_center_opp));
            jumping = false
            move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
            }else{
                thoughts = "Dive?"
                if dive_cooldown == 0{
                    if round(random_range(1, 6)) == 1 and jumping == false and obj_quaffle.speed > 3 and distance_to_object(obj_quaffle) < 160{
                        thoughts = "Dive!"
                        if global.threedmode == false{
                            if abs(global.marker2x-obj_center_opp.x) > 32{
                                jumping = true
                            }
                            if global.marker2x > obj_center_opp.x{
                                jumpX = obj_smedium_opp.x
                                jumpY = y
                                dive_cooldown = 30
                            }
                            if global.marker2x > obj_center_opp.x == false{
                                jumpX = obj_baby_opp.x
                                jumpY = y
                                dive_cooldown = 30
                                }
                        }else{
                            if abs(global.marker2y-obj_center_opp.y) > 32{
                                jumping = true
                            }
                            if global.marker2y > obj_center_opp.y{
                                jumpY = obj_smedium_opp.y
                                jumpX = x
                                dive_cooldown = 30
                            }
                            if global.marker2y > obj_center_opp.y == false{
                                jumpY = obj_baby_opp.y
                                jumpX = x
                                dive_cooldown = 30
                                }
                            }                        
                        }else{
                            if instance_exists(obj_quaffle){
                                move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
                                thoughts = "Can't dive, move on quaffle1."
                            }                        
                        }
                    }else{
                        if instance_exists(obj_quaffle){
                            move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
                            thoughts = "Can't dive, move on quaffle2."
                        }
                    }
                if jumping == true{
                    move_towards_point(jumpX, jumpY, st_power + 3)
                    thoughts = "JUMP"
                    if distance_to_point(jumpX, jumpY) > 6{
                        jumping = false
                    }
                }
                if (distance_to_point(obj_quaffle.x, obj_quaffle.y) < distance_to_point(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x, instance_nearest(global.ballX, global.ballY, obj_player_dummy).y)) and (distance_to_point(obj_center_opp.x, obj_center_opp.y) - po_keeper_distance) > 8{
                    sprint = 1
                    move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
                    thoughts = "I am closer, sprint on quaffle"
                }
            }
        }
          if st_position < 3  and instance_exists(obj_passmarker){ //if pass to me, disregard all else //and obj_quaffle.pass == 1 removed
            if distance_to_point(obj_passmarker.x, obj_passmarker.y) < 48{ //originally global.marker1x, global.marker1y
                thoughts = "pass coming to me."
                if distance_to_point(obj_passmarker.x, obj_passmarker.y) > 16 and distance_to_point(global.ballX, global.ballY) > 48 and
                scr_chaser_teammate_closest_pass("x") == x and scr_chaser_teammate_closest_pass("y") == y and throw_leway == 0{
                    //obj_passmarker.x, obj_passmarker.y) > 16 makes sure the player doesn't vibrate
                    //If I'm far enough from the ball that I shouldn't run to it
                    //If I am the person being passed to
                    //If I am not the passer
                    if(distance_to_point(obj_passmarker.x, obj_passmarker.y) >= 24){
                        sprint = 1 //far from where pass will be, SPRINT there
                    }else{
                        sprint = 0 //am close to where pass will be, don't sprint
                    }
                    move_towards_point(obj_passmarker.x, obj_passmarker.y, moving_speed)
                    /*if irandom_range(0, round(obj_quaffle.speed+1)*5) == 1{ //as quaffle slows down, think about resetting passmarker
                        global.marker1x = 0
                        global.marker1y = 0
                    }*/
                }else{ //if I'm pretty close to the quaffle
                    sprint = 1
                    move_towards_point(global.ballX, global.ballY, moving_speed)
                    if distance_to_point(global.ballX, global.ballY) <= 48 and obj_quaffle.pass == 1{ //if close to ball, move closer to ball
                        move_towards_point(global.ballX, global.ballY, moving_speed)
                        obj_passmarker.x = (global.ballX+obj_passmarker.x)/2
                        obj_passmarker.y = (global.ballY+obj_passmarker.y)/2
                    }
                }
            }else{
                //do nothing, the pass isn't coming to me
            }
          }
          if st_position < 3 and (instance_nearest(global.ballX, global.ballY, obj_player_teammate).x == x and instance_nearest(global.ballX, global.ballY, obj_player_teammate).y == y){
                sprint = 1
                move_towards_point(obj_quaffle.x, obj_quaffle.y, moving_speed)
                thoughts = "I am closest player to quaffle. Sprint on quaffle!"
            }
          if st_position == 3{ //beater
            if instance_exists(obj_bludger){ //if true is covered later down
                if ch_ball == false{
                    move_towards_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y, moving_speed)
                    thoughts = "Retrieve bludger"
                }else{
                    //if I have the ball and my teammate doesn't
                    //if I am closer to the ball than I am to my beater buddy
                    if ch_ball == true and scr_beater_teammate_is_bludgerless() and
                    distance_to_point(scr_beater_teammate_nearest_me(x, y, "x"), scr_beater_teammate_nearest_me(x, y, "y")) > distance_to_object(instance_nearest(x, y, obj_bludger)){
                        move_towards_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y, moving_speed)
                        thoughts = "Retrieve bludger for beater buddy"
                        if distance_to_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y) < 96{ //if nearest bludger is close
                            //throw bludger towards hoops
                            thoughts = "throw at beater buddy or hoops?"
                            if(windup < 8){  //does throwing windup animation
                                windup += 1
                            }
                            if round(random_range (1, 8)) == 1{
                                global.throw = st_throw
                                global.accuracy = st_accuracy
                                throw_leway = 15
                                if(distance_to_point(scr_eligible_beater_teammate_location("x"), scr_eligible_beater_teammate_location("y")) < distance_to_point(obj_baby_score_opp.x, obj_baby_score_opp.y)+16){
                                    global.targetX = scr_eligible_beater_teammate_location("x")
                                    global.targetY = scr_eligible_beater_teammate_location("y")
                                    global.targetSpeed = 0
                                    if(global.threedmode == true){
                                        global.targetX = obj_baby_score_opp.x
                                    }else{
                                        global.targetY = obj_baby_score_opp.y
                                    }
                                    if(scr_is_target_teammate_beat(global.targetX, global.targetY)){ //he's beat, don't pass to him, throw to hoops
                                        scr_throw_ball(obj_bludger, x, y, 13, 0) //13 or 14 depending on team
                                        ch_ball = false
                                        exit
                                    }
                                    scr_throw_ball(obj_bludger, x, y, 7, 0) //7 or 9 depending on team
                                    ch_ball = false
                                }else{
                                    //throws towards center hoop
                                    scr_throw_ball(obj_bludger, x, y, 13, 0) //13 or 14 depending on team
                                    ch_ball = false
                                }
                                exit
                                }
                            }
                            if(windup > 0){
                                windup -= 0.5 //if not thinking about throwing, lower ball, won't get to this line if exited
                            }                 
                        }  
                    }
                }else{
                    if distance_to_object(obj_center_opp) > 48{
                        move_towards_point(obj_center_opp.x, obj_center_opp.y-48, moving_speed)
                        thoughts = "Move above center hoop"
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                        thoughts = "Stare at ball"
                    }
                    if ch_ball == false and ((global.threedmode == true and global.ballX > room_width/2) or (global.threedmode == false and global.ballY < room_height/2)){
                        move_towards_point(scr_beater_dummy_nearest_me(x, y, "x"), scr_beater_dummy_nearest_me(x, y, "y"), moving_speed)
                        thoughts = "Attack opposing beater2"
                    }
                }
            }
        }
    }
    if global.possession == 2{ //if other team has quaffle
        if st_position < 4{
            if global.threedmode == true{
                if(x > global.ballX){
                    if (speed > 0){ //if not staring at ball
                        sprint = 1 //other team's QC is closer to the hoops than me! Sprint to my position!
                    }
                }
            }else{
                if(y < global.ballY){
                    if (speed > 0){
                        sprint = 1
                    }
                }
            }
        }
        if st_position == 1{
            if distance_to_point(global.ballX, global.ballY) < 32{ //if close to quaffle, I'm either sprinting onto it or sprinting to my defensive position because I'm close to the QC
                sprint = 1
            }
            if distance_to_point(global.ballX, global.ballY) > 24 and ((global.threedmode == false and y < po_chaser_zone) or (global.threedmode == true and x > po_chaser_zone)){
                if defense == 0{ //man
                    if global.threedmode == false{
                        if manStrategy == 0{
                            if distance_to_point(global.ballX, po_chaser_zone) > 16{
                                move_towards_point(global.ballX, po_chaser_zone, moving_speed)
                                thoughts = "Move in front of point"
                                draw_direction = (scr_balldirection() + 180);
                            }else{
                                move_towards_point(global.ballX, global.ballY, 0)
                                thoughts = "In front of point; stare"           
                                draw_direction = (scr_balldirection() + 180);                 
                            }
                            if global.ballY > po_chaser_zone{ //was originally ballX 05/25/2017
                                sprint = 1
                                move_towards_point(global.ballX, global.ballY, moving_speed)
                                thoughts = "Past chaser zone; attack 1!"
                                if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                    if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 8{
                                        move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                        thoughts = "Already wrapped, move between them and hoops."
                                    }else{
                                        move_towards_point(global.ballX, global.ballY, 0);
                                        sprint = 0
                                        thoughts = "Stay between them and hoops."
                                    }
                                }                                                               
                            }
                        }
                        if manStrategy == 1 or manStrategy == 2{
                            if man.x < room_width/2{
                                move_towards_point(po_dx, man.y, moving_speed)
                                thoughts = "Move in front of man"
                            }else{
                                move_towards_point(po_dx, man.y, 0)
                                thoughts = "In front of man; stare"                            
                            }
                            if man.x < room_width/2{
                                if distance_to_point(man.x, man.y) > 64 - st_speed*2{
                                    move_towards_point(man.x, man.y, moving_speed)
                                }
                                thoughts = "Past chaser zone; cover!"                               
                            }                        
                        }
                    }else{ //if global.threedmode == true
                        if manStrategy == 0{
                            if distance_to_point(po_chaser_zone, global.ballY) > 16{
                                move_towards_point(po_chaser_zone, global.ballY, moving_speed)
                                thoughts = "Move in front of point"
                            }else{
                                move_towards_point(global.ballX, global.ballY, 0)
                                thoughts = "In front of point; stare"
                            }
                            if global.ballX < po_chaser_zone{
                                sprint = 1
                                move_towards_point(global.ballX, global.ballY, moving_speed)
                                thoughts = "Past chaser zone; attack 2!"       
                                if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                    if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                        move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                        thoughts = "Already wrapped, move between them and hoops 2."
                                    }else{
                                        move_towards_point(global.ballX, global.ballY, 0);
                                        thoughts = "Stay between them and hoops 2."
                                    }
                                }                           
                            }
                        }
                        if manStrategy == 1 or manStrategy == 2{
                            if man.y > room_height/2{
                                move_towards_point(man.x, po_dy, moving_speed)
                                thoughts = "Move in front of man"
                            }else{
                                move_towards_point(man.x, po_dy, 0)
                                thoughts = "In front of man; stare"                            
                            }
                            if man.y < room_height/2{
                                if distance_to_point(man.x, man.y) > 64 - st_speed*2{
                                    move_towards_point(man.x, man.y, moving_speed)
                                }
                                thoughts = "Past chaser zone; cover!"                               
                            }                        
                        }
                    }
                }
                if defense == 1{
                    if distance_to_point(global.ballX, global.ballY) < 32{ //I'm close to quaffle, get to defense QUICK!
                        sprint = 1
                    }
                    if distance_to_point(po_dx, po_dy) > 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                    }
                    thoughts = "Ball far; zone def"
                    if(distance_to_point(global.ballX, global.ballY) < po_radius){
                        thoughts = "In radius, attack!"
                        sprint = 1
                        move_towards_point(global.ballX, global.ballY, moving_speed)
                    }
                    else if(distance_to_point(po_dx, po_dy) >= po_radius){ //if I have been displaced from my zone or I haven't gotten to my zone yet
                        if(point_distance(po_dx, po_dy, global.ballX, global.ballY) < po_radius*1.5 and distance_to_point(global.ballX, global.ballY) < po_radius*.5
                            or ((instance_nearest(global.ballX, global.ballY, obj_player_teammate).x == x and instance_nearest(global.ballX, global.ballY, obj_player_teammate).y == y) and
                            point_distance(obj_baby_score_opp.x, obj_baby_score_opp.y, global.ballX, global.ballY) < 144))
                            //if the quaffle carrier is slightly outside of my zone
                            //if I sufficiently close enough to the quaffle carrier that if my zone were half its size, I would begin chasing him
                            //or if I am the closest player to the quaffle carrier and they sufficiently are close to hoops
                            thoughts = "Outside zone, keep pursuing."
                            sprint = 1
                            move_towards_point(po_dx, po_dy, moving_speed)
                    }else if distance_to_point(po_dx, po_dy) > 16{
                        thoughts = "Return to zone, quaffle is too far."
                        sprint = 0
                        move_towards_point(po_dx, po_dy, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                    }
                }
            }else{
                if defense == 0 and manStrategy == 0{ //man def
                    if (global.threedmode == false and abs(y-po_chaser_zone) < 8 and global.ballY > po_chaser_zone == false) or (global.threedmode == true and abs(x-po_chaser_zone) < 8 and global.ballX < po_chaser_zone){ //if close to halfway line and ball not past halfway line
                        if (global.threedmode == false and abs(x-global.ballX) > 32) or (global.threedmode == true and abs(y-global.ballY) > 32){
                            //May need modification to incorporate teammate
                            thoughts = "Face ball; strafe towards ball"
                            if global.threedmode == false{
                                move_towards_point(global.ballX, y, moving_speed)
                                if global.ballY > po_chaser_zone{
                                    sprint = 1
                                    move_towards_point(global.ballX, global.ballY, moving_speed)
                                    thoughts = "Past chaser zone; attack!"    
                                    if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                        if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                            move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                            thoughts = "Already wrapped, move between them and hoops 3."
                                        }else{
                                            move_towards_point(global.ballX, global.ballY, 0);
                                            thoughts = "Stay between them and hoops 3."
                                        }
                                    }                              
                                }
                            }else{
                                move_towards_point(x, global.ballY, moving_speed)
                                if global.ballX < po_chaser_zone{
                                    sprint = 1
                                    move_towards_point(global.ballX, global.ballY, moving_speed)
                                    thoughts = "Past chaser zone; attack!"
                                    if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                        if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                            move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                            thoughts = "Already wrapped, move between them and hoops 3."
                                        }else{
                                            move_towards_point(global.ballX, global.ballY, 0);
                                            thoughts = "Stay between them and hoops 3."
                                        }
                                    }                                
                                }
                            }
                            /*if instance_exists(obj_player_test){
                                if x > obj_player_test.x{
                                    x = -1*(x+moving_speed)
                                    }else{
                                    x = x+moving_speed
                                    }*/
                                thoughts = "Face ball; strafe towards ball"
                            }else{
                                move_towards_point(global.ballX, global.ballY, 0)
                                thoughts = "Ball not within zone; chill"
                                if(global.threedmode == true and global.ballX < x){
                                    move_towards_point(global.ballX, global.ballY, moving_speed)
                                    sprint = 1
                                    thoughts = "Ball is past me, attack!"     
                                    if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                        if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                            move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                            thoughts = "Already wrapped, move between them and hoops 4."
                                        }else{
                                            move_towards_point(global.ballX, global.ballY, 0);
                                            thoughts = "Stay between them and hoops 4."
                                        }
                                    }                           
                                }
                                if(global.threedmode == false and global.ballY > y){
                                    move_towards_point(global.ballX, global.ballY, moving_speed)
                                    sprint = 1
                                    thoughts = "Ball is past me, attack!"   
                                    if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                        if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                            move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                            thoughts = "Already wrapped, move between them and hoops 5."
                                        }else{
                                            move_towards_point(global.ballX, global.ballY, 0);
                                            thoughts = "Stay between them and hoops 5."
                                        }
                                    }                             
                                }
                            }
                        }else{
                            if scr_getKeeperBall() and ((global.threedmode == true and global.ballX > (room_width/2)+32) or (global.threedmode == false and global.ballY < (room_height/2)-32)) or (instance_nearest(global.ballX, global.ballY, obj_player_dummy).immunitycount > 0){
                                if distance_to_point(po_dx, po_dy) > 4{
                                    move_towards_point(po_dx, po_dy, moving_speed)
                                }else{
                                    move_towards_point(global.ballX, global.ballY, 0)
                                }
                                thoughts = "Retreat to defensive position."
                            }else{
                                move_towards_point(global.ballX, global.ballY, moving_speed) //if nothing else; bug patch for not doing anything
                                thoughts = "Sprint on ball."
                                sprint = 1
                                if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                    if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                        move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                        thoughts = "Already wrapped, move between them and hoops 6."
                                    }else{
                                        move_towards_point(global.ballX, global.ballY, 0);
                                        thoughts = "Stay between them and hoops 6."
                                    }
                                }   
                            }
                        }
                    }else
                if defense == 0 and manStrategy == 1 or manStrategy == 2{
                    if scr_chaser_teammate_closest_quaffle("x") == x and scr_chaser_teammate_closest_quaffle("y") == y{
                        move_towards_point(global.ballX, global.ballY, moving_speed) //if nothing else; bug patch for not doing anything
                        thoughts = "Intercept or tackle."
                        sprint = 1                    
                    }
                }else
                if defense == 1{
                    if distance_to_point(global.ballX, global.ballY) < po_radius and ((global.threedmode == false and global.ballY > po_chaser_zone == true) or (global.threedmode == true and global.ballX < po_chaser_zone == true)){ //if ball within radius and past halfway line
                        move_towards_point(global.ballX, global.ballY, moving_speed) //if nothing else; bug patch for not doing anything
                        thoughts = "Sprint on ball."
                        sprint = 1
                        if scr_ballwrapped() != 0 and drag != 1{ //if the ball is wrapped and I am not the one wrapping!
                                if distance_to_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2) > 4{
                                    move_towards_point((instance_nearest(x, y, obj_baby_score_opp).x+global.ballX)/2, (instance_nearest(x, y, obj_baby_score_opp).y+global.ballY)/2, moving_speed)
                                    thoughts = "Already wrapped, move between them and hoops 5."
                                }else{
                                    move_towards_point(global.ballX, global.ballY, 0);
                                    thoughts = "Stay between them and hoops 5."
                                }
                            }
                    }else{
                        if(distance_to_point(global.ballX, global.ballY) < po_radius){
                            thoughts = "In radius, attack 2!"
                            sprint = 1
                            move_towards_point(global.ballX, global.ballY, moving_speed)
                        }else
                        if distance_to_point(po_dx, po_dy) > 6{
                                if distance_to_object(obj_baby_score_opp) > 4{
                                    move_towards_point(po_dx, po_dy, moving_speed)
                                    thoughts = "Move to def position"
                                }else{
                                    thoughts = "Bumping into hoop"
                                }
                        }else{
                            move_towards_point(global.ballX, global.ballY, 0)
                            thoughts = "Stare at ball 1"
                            }
                        }
                    }else{
                        thoughts = "ERROR. I DONT KNOW WHAT TO DO!"
                    }
                }
            if instance_exists(obj_scuffle){
                thoughts = "Move on scuffle"
                if distance_to_object(obj_scuffle) > 48{
                    move_towards_point(obj_scuffle.x, obj_scuffle.y, moving_speed)
                }else{
                    thoughts = "Stare at scuffle"
                    move_towards_point(obj_scuffle.x, obj_scuffle.y, 0)
                }
            }
        }
        if st_position == 2{
                if global.ballY < obj_center_opp.y{
                    if distance_to_point(obj_center_opp.x, obj_center_opp.y-po_keeper_distance) > 8{
                        move_towards_point(obj_center_opp.x, obj_center_opp.y-po_keeper_distance, moving_speed)
                        thoughts = "Move behind center hoop"
                        }
                        if distance_to_point(obj_center_opp.x, obj_center_opp.y-po_keeper_distance) < 4{
                            move_towards_point(global.ballX, global.ballY, 0)
                            thoughts = "Stare at ball."                        
                        }
                    }  
                if global.ballY > obj_center_opp.y{
                    if distance_to_point(obj_center_opp.x, obj_center_opp.y+po_keeper_distance) > 8{
                        move_towards_point(obj_center_opp.x, obj_center_opp.y+po_keeper_distance, moving_speed)
                        thoughts = "Move in front of center hoop"
                        }
                        if distance_to_point(obj_center_opp.x, obj_center_opp.y+po_keeper_distance) < 4{
                            move_towards_point(global.ballX, global.ballY, 0)
                            thoughts = "Stare at ball."                        
                        }
                    }
            if distance_to_point(global.ballX, global.ballY) < po_radius{
                if scr_getKeeperBall() and ((global.threedmode == true and global.ballX > (room_width/2)-32) or (global.threedmode == false and global.ballY < (room_height/2)+32)){
                    if distance_to_point(po_dx, po_dy) > 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                    }
                    thoughts = "Retreat to defensive position."
                }else{
                    thoughts = "Sprint to ball carrier"
                    sprint = 1
                    if y+8 < global.ballY and global.ballY < obj_center_opp.y{ //Move body inbetween hoops and ball
                        move_towards_point(global.ballX, global.ballY-16, moving_speed)
                    }else{
                        if y-8 > global.ballY and global.ballY > obj_center_opp.y{
                            move_towards_point(global.ballX, global.ballY+16, moving_speed)
                        }else{
                        move_towards_point(global.ballX, global.ballY, moving_speed)
                            }
                        }
                    }
                }
            }
            if st_position == 3{
                if ch_ball == true{ //and there isn't an opportune bludger nearby
                    if distance_to_point(global.ballX, global.ballY) > po_radius{
                        thoughts = "Move to def; stare at ball"
                        if distance_to_point(po_dx, po_dy) > 4{
                            move_towards_point(po_dx, po_dy, moving_speed)
                        }else{
                            move_towards_point(global.ballX, global.ballY, 0)
                        }   
                    }else{
                        move_towards_point(global.ballX, global.ballY, moving_speed)
                        sprint = 1
                        thoughts = "Sprint on ball"
                        }
                }else{ //if no ball
                    thoughts = "Move to def; stare at ball"
                    if distance_to_point(po_dx, po_dy) > 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                        }                           
                }
                if(windup > 0){
                    windup -= 0.5 //if not thinking about throwing, lower ball, won't get to this line if exited
                }    
            } 
                if st_position == 3 and instance_exists(obj_bludger){
                    if ch_ball == false{
                        if(instance_nearest(x, y, obj_bludger).speed < 1) or instance_number(obj_bludger) == 1{
                            move_towards_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y, moving_speed)
                            thoughts = "Attain nearest bludger"
                        }else if instance_number(obj_bludger) == 2 and (distance_to_point(instance_furthest(x, y, obj_bludger).x, instance_furthest(x, y, obj_bludger).y) < 128) and instance_furthest(x, y, obj_bludger).speed < 1{
                                //this for a situation where a player throws a bludger back or is chasing a fast-moving bludger
                                move_towards_point(instance_furthest(x, y, obj_bludger).x, instance_furthest(x, y, obj_bludger).y, moving_speed)
                                thoughts = "Go for stationary bludger"
                        }else if instance_number(obj_bludger) == 3 and distance_to_point(scr_instance_nth_nearest(x, y, obj_bludger, 2).x, scr_instance_nth_nearest(x, y, obj_bludger, 2).y,) < 128 and scr_instance_nth_nearest(x, y, obj_bludger, 2).speed < 1{
                            move_towards_point(scr_instance_nth_nearest(x, y, obj_bludger, 2).x, scr_instance_nth_nearest(x, y, obj_bludger, 2).y, moving_speed)
                            thoughts = "Go for second-closest bludger"
                        }else{ //just move towards nearest bludger
                            move_towards_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y, moving_speed)
                            thoughts = "Just go for closest bludger"
                        }
                    }
                    if ch_ball == true and scr_beater_teammate_is_bludgerless() and ((global.threedmode == true and global.ballX > room_width/2+64) or (global.threedmode == false and global.ballY < room_height/2-64)){
                        move_towards_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y, moving_speed)
                        thoughts = "Retrieve bludger for beater buddy"
                        if distance_to_point((instance_nearest(x, y, obj_bludger)).x, (instance_nearest(x, y, obj_bludger)).y) < 96{
                            //throw bludger towards hoops
                            thoughts = "Throw bludger towards hoops?"
                            if(windup < 8){
                                windup += 1
                            }
                            if round(random_range (1, 8)) == 1{
                                global.throw = st_throw
                                global.accuracy = st_accuracy
                                ch_ball = false
                                throw_leway = 15
                                //throw towards center hoop
                                scr_throw_ball(obj_bludger, x, y, 13, 0)
                                exit
                            }
                        }                
                    }
                }
                if instance_exists(obj_scuffle) and ch_ball == true and ((global.threedmode == false and global.ballY > room_height/2-64) or (global.threedmode == true and global.ballX < room_width/2+64)){ //Own possession
                    if (global.threedmode == false and obj_scuffle.y > room_height/2-64) or (global.threedmode == true and obj_scuffle.x < room_width/2+64){
                        move_towards_point(obj_scuffle.x, obj_scuffle.y, moving_speed)
                        sprint = 1
                        thoughts = "Beat scuffle"
                    }else{
                        if distance_to_point(po_dx, po_dy) < 4{
                            move_towards_point(po_dx, po_dy, moving_speed)
                            thoughts = "Ignore scuffle; Retreat"
                        }else{
                            move_towards_point(global.ballX, global.ballY, 0)
                        }
                    }
                }
            }
        
    if global.possession == 1 and st_position < 3{ //If quaffle in possession and chaser/keeper
        if ch_ball == true{
            if hoopchoice == 0{
                hoopchoice = round(random(2))+1
            }
            if global.threedmode == true{
                if hoopchoice == 1{
                    if distance_to_point(obj_baby_hoop.x+48, obj_baby_hoop.y) > 4{
                        move_towards_point(obj_baby_hoop.x+48, obj_baby_hoop.y, moving_speed)
                    }else{
                        move_towards_point(obj_baby_hoop.x+48, obj_baby_hoop.y, 0)
                    }
                }
                if hoopchoice == 2{
                    if distance_to_point(obj_center_hoop.x+48, obj_center_hoop.y) > 4{
                        move_towards_point(obj_center_hoop.x+48, obj_center_hoop.y, moving_speed)
                    }else{
                        move_towards_point(obj_center_hoop.x+48, obj_center_hoop.y, 0)
                    }
                }
                if hoopchoice == 3{
                    if distance_to_point(obj_smedium_hoop.x+48, obj_smedium_hoop.y) > 4{
                        move_towards_point(obj_smedium_hoop.x+48, obj_smedium_hoop.y, moving_speed)
                    }else{
                        move_towards_point(obj_smedium_hoop.x+48, obj_smedium_hoop.y, 0)
                    }
                }
            }else{
                if hoopchoice == 1{
                    if distance_to_point(obj_baby_hoop.x, obj_baby_hoop.y+8) > 4{
                        move_towards_point(obj_baby_hoop.x, obj_baby_hoop.y+8, moving_speed)
                    }else{
                        move_towards_point(obj_baby_hoop.x, obj_baby_hoop.y+8, 0)
                    }
                }
                if hoopchoice == 2{
                    if distance_to_point(obj_center_hoop.x, obj_center_hoop.y+8) > 4{
                        move_towards_point(obj_center_hoop.x, obj_center_hoop.y+8, moving_speed)
                    }else{
                        move_towards_point(obj_center_hoop.x, obj_center_hoop.y+8, 0)
                    }
                }
                if hoopchoice == 3{
                    if distance_to_point(obj_smedium_hoop.x, obj_smedium_hoop.y+8) > 4{
                        move_towards_point(obj_smedium_hoop.x, obj_smedium_hoop.y+8, moving_speed)
                    }else{
                        move_towards_point(obj_smedium_hoop.x, obj_smedium_hoop.y+8, 0)
                    }
                }            
            }
            if distance_to_point(global.ballX, global.ballY) < 64 and global.possession == 2{
                move_towards_point(global.ballX, global.ballY, moving_speed)
                //original code for moving on player removed
            }
            if distance_to_object(obj_baby_score) < 160{ //if close enough to hoops, possible take a shot
                thoughts = "Shoot to hoop?"
                if(windup < 8){
                    windup += 1
                }
                if round(random_range(1, 8)) == 1{ //take a shot if decide to
                    hoopchoice = irandom(2)+1 //random hoop choice
                    if distance_to_object(obj_baby_score) < 48{ //if very close to one particular hoop, choose that hoop
                        if global.threedmode == true{
                            if (abs(obj_baby_hoop.y-y) < 24){
                                hoopchoice = 1
                            }
                            if (abs(obj_center_hoop.y-y) < 24){
                                hoopchoice = 2
                            }
                            if (abs(obj_smedium_hoop.y-y) < 24){
                                hoopchoice = 3
                            }
                        }else{
                            if (abs(obj_baby_hoop.x-x) < 24){
                                hoopchoice = 1
                            }
                            if (abs(obj_center_hoop.x-x) < 24){
                                hoopchoice = 2
                            }
                            if (abs(obj_smedium_hoop.x-x) < 24){
                                hoopchoice = 3
                            }                        
                        }
                    }
                    //OTHERWISE go with the random hoop!
                    if global.threedmode == true{ //if a bad angle, don't throw!
                        if hoopchoice == 1{ //baby hoop
                            if ((abs(obj_baby_hoop.x-x)) < (abs(obj_baby_hoop.y-y))){
                                exit
                            }
                        }
                        if hoopchoice == 2{ //baby hoop
                            if ((abs(obj_center_hoop.x-x)) < (abs(obj_center_hoop.y-y))){
                                exit
                            }
                        }
                        if hoopchoice == 3{ //baby hoop
                            if ((abs(obj_smedium_hoop.x-x)) < (abs(obj_smedium_hoop.y-y))){
                                exit
                            }
                        }
                    }else{
                        if hoopchoice == 1{ //baby hoop
                            if ((abs(obj_baby_hoop.y-y)) < (abs(obj_baby_hoop.x-x))){
                                exit
                            }
                        }
                        if hoopchoice == 2{ //baby hoop
                            if ((abs(obj_center_hoop.y-y)) < (abs(obj_center_hoop.x-x))){
                                exit
                            }
                        }
                        if hoopchoice == 3{ //baby hoop
                            if ((abs(obj_smedium_hoop.y-y)) < (abs(obj_smedium_hoop.x-x))){
                                exit
                            }
                        }                    
                    }
                    if(global.threedmode == true){ //Don't throw if at bad angle, exit event
                        if(hoopchoice == 1){
                            if((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 72 and (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 108))
                            or ((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 252 and (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 288)){ //bad angle
                                thoughts = "Bad angle for shot."
                                exit
                            }
                        }
                        if(hoopchoice == 2){
                            if((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 72 and (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 108))
                            or ((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 252 and (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 288)){ //bad angle
                                thoughts = "Bad angle for shot."
                                exit
                            }
                        }
                        if(hoopchoice == 3){
                            if((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 72 and (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 108))
                            or ((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 252 and (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 288)){ //bad angle
                                thoughts = "Bad angle for shot."
                                exit
                            }                    
                        }
                    }else{ //in top-down mode
                        if(hoopchoice == 1){
                            if((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 162 and (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 198))
                            or ((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 342 or (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 18)){ //bad angle
                                thoughts = "Bad angle for shot."
                                exit
                            }
                        }
                        if(hoopchoice == 2){
                            if((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 162 and (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 198))
                            or ((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 342 or (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 18)){ //bad angle
                                thoughts = "Bad angle for shot."
                                exit
                            }
                        }
                        if(hoopchoice == 3){
                            if((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 162 and (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 198))
                            or ((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 342 or (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 18)){ //bad angle
                                thoughts = "Bad angle for shot."
                                exit
                            }                    
                        }                    
                    }
                    global.throw = st_throw
                    global.accuracy = st_accuracy
                    ch_ball = false
                    throw_leway = 15
                    sprint = false
                    global.hoopchoice = hoopchoice
                    /*
                    var inst;
                     inst = instance_create(x, y, obj_Bullet);
                     with (inst)
                        {
                        speed = other.shoot_speed;
                        direction = other.image_angle;
                        }*/
                     /*var inst;
                     inst = instance_create(x, y, obj_quaffle);
                     with(inst){ //these are called AFTER the create function
                        speed = 5;
                        direction = 0;
                     }*/
                    scr_throw_ball(obj_quaffle, x, y, 5, 0)
                    //show_message("Shoot at hoop" + string(hoopchoice))
                    exit
                }
            }
            if distance_to_object(obj_baby_score) < 32{
                if(windup < 8){ //windup added later for teammate.
                    windup += 1
                }
                thoughts = "Lay up"
                if distance_to_point(obj_baby_hoop.x, obj_baby_hoop.y) < 32{
                    hoopchoice = 1
                }
                if distance_to_point(obj_center_hoop.x, obj_center_hoop.y) < 32{
                    hoopchoice = 2
                }
                if distance_to_point(obj_smedium_hoop.x, obj_smedium_hoop.y) < 32{
                    hoopchoice = 3
                }
                if(global.threedmode == true){ //Don't throw if at bad angle, exit event
                    if(hoopchoice == 1){
                        if((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 72 and (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 108))
                        or ((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 252 and (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 288)){ //bad angle
                            thoughts = "Bad angle for shot."
                            exit
                        }
                    }
                    if(hoopchoice == 2){
                        if((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 72 and (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 108))
                        or ((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 252 and (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 288)){ //bad angle
                            thoughts = "Bad angle for shot."
                            exit
                        }
                    }
                    if(hoopchoice == 3){
                        if((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 72 and (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 108))
                        or ((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 252 and (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 288)){ //bad angle
                            thoughts = "Bad angle for shot."
                            exit
                        }                    
                    }
                }else{ //in top-down mode
                    if(hoopchoice == 1){
                        if((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 162 and (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 198))
                        or ((point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y) > 342 or (point_direction(x,y,obj_baby_hoop.x,obj_baby_hoop.y)) < 18)){ //bad angle
                            thoughts = "Bad angle for shot."
                            exit
                        }
                    }
                    if(hoopchoice == 2){
                        if((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 162 and (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 198))
                        or ((point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y) > 342 or (point_direction(x,y,obj_center_hoop.x,obj_center_hoop.y)) < 18)){ //bad angle
                            thoughts = "Bad angle for shot."
                            exit
                        }
                    }
                    if(hoopchoice == 3){
                        if((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 162 and (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 198))
                        or ((point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y) > 342 or (point_direction(x,y,obj_smedium_hoop.x,obj_smedium_hoop.y)) < 18)){ //bad angle
                            thoughts = "Bad angle for shot."
                            exit
                        }                    
                    }                    
                }
                if(abs(truedirection - direction) >= 20) or windup < 5{
                    if distance_to_object(obj_baby_score_opp) < 16{
                        moving_speed = 0
                    }
                    exit
                }
                    global.throw = st_throw
                    global.accuracy = st_accuracy
                    ch_ball = false
                    throw_leway = 15
                    global.hoopchoice = hoopchoice
                    scr_throw_ball(obj_quaffle, x, y, 5, 0)
                    sprint = false
                    //show_message("Shoot at hoop" + string(hoopchoice))
                    exit
            }
            if distance_to_object(obj_player_dummy) < 24 and instance_nearest(x, y, obj_player_dummy).st_position < 4 and
            instance_nearest(x, y, obj_player_dummy).tackle == false and instance_nearest(x, y, obj_player_dummy).ch_off_broom == false
            and immunitycount == 0{ //threatened by opposing player
            thoughts = "Threatened"
                if(windup < 8){
                    windup += 1
                }
                    /*with(obj_player_teammate){
                        if (st_position < 3 and ch_ball == false and distance_to_point(global.ballX, global.ballY) < 64) or (ch_ball == true and st_position == 3){
                        thoughts = "QC is threatened; help"
                        move_towards_point(global.ballX, global.ballY, moving_speed)
                        }
                    }*/
                if advancechoice = 0{ //charge
                    if random(15) > 8{
                    advancechoice = irandom(2)
                    }
                }else{
                advancechoice = irandom(2)
                }
                if advancechoice == -1{ //reset quaffle by throwing backwards
                    ch_ball = false
                    scr_throw_ball(obj_quaffle, x, y, 8, 0)
                    advancechoice = 0
                    exit
                }
                if advancechoice == 2 or advancechoice == 1{
                    thoughts = "Checking passing option"
                    with(obj_player_teammate){
                        scr_check_eligible_pass() //sets target to an eligible receiver location and returns true
                    }
                    if (obj_player_teammate.x == global.targetX) and (obj_player_teammate.y  == global.targetY) and (global.targetX != x or global.targetY != y){
                        global.targetY = global.targetY + 12 //throw towards center mass ;)
                        global.throw = st_throw
                        global.accuracy = st_accuracy
                        global.targetSpeed = 0
                        global.targetDirection = 0
                        scr_throw_ball(obj_quaffle, x, y, 9, 0)
                        ch_ball = false
                        instance_create(global.targetX, global.targetY, obj_passmarker)
                        if(global.mute == false){
                            if(st_gender == 2){
                                sound_play(snd_passboy)
                            }else{
                                sound_play(snd_passgirl)
                            }
                        }
                        //("Pass")
                        exit
                    }
                    advancechoice = 0
                }
                if advancechoice == 1{
                thoughts = "Shoot to hoop?"
                if round(random_range(1, 8)) == 1{
                    hoopchoice = irandom(2)+1
                    global.throw = st_throw
                    global.accuracy = st_accuracy
                    ch_ball = false
                    throw_leway = 15
                    global.hoopchoice = hoopchoice
                    scr_throw_ball(obj_quaffle, x, y, 5, 0)
                    sprint = false
                    //show_message("Shoot at hoop" + string(hoopchoice))
                    exit
                    }
                }
            }
            if distance_to_object(obj_player_dummy) < 48 and instance_nearest(x, y, obj_player_dummy).st_position == 3 and instance_nearest(x, y, obj_player_dummy).tackle == false and instance_nearest(x, y, obj_player_dummy).ch_ball == true{
                if advancechoice = 0{ //charge
                    if random(10) > 9{
                        advancechoice = irandom(2)
                    }
                }else{
                    advancechoice = irandom(2)
                }
                if advancechoice == 1{ //reset
                    thoughts = "Shoot to hoop?"
                    if(windup < 8){
                        windup += 1
                    }
                    if round(random_range(1, 8)) == 1{
                        hoopchoice = irandom(2)+1
                        global.throw = st_throw
                        global.accuracy = st_accuracy
                        ch_ball = false
                        throw_leway = 15
                        global.hoopchoice = hoopchoice
                        scr_throw_ball(obj_quaffle, x, y, 3, 0)
                        sprint = false
                        //show_message("Shoot at hoop" + string(hoopchoice))
                        exit
                        }
                }
                if advancechoice == 2{
                    with(obj_player_teammate){
                        scr_check_eligible_pass() //Correct script, "teammate" is for dummy; I know, it's confusing
                    }
                    if position_meeting(global.targetX, global.targetY, obj_player_dummy) and (global.targetX != x or global.targetY != y){
                        global.targetY = global.targetY + 12 //throw towards center mass ;)
                        global.throw = st_throw
                        global.accuracy = st_accuracy
                        global.targetSpeed = 0
                        global.targetDirection = 0
                        scr_throw_ball(obj_quaffle, x, y, 7, 0)
                        ch_ball = false
                        instance_create(global.targetX, global.targetY, obj_passmarker)
                        if(global.mute == false){
                            if(st_gender == 2){
                                sound_play(snd_passboy)
                            }else{
                                sound_play(snd_passgirl)
                            }
                        }
                        //("Pass")
                        exit
                    }
                    advancechoice = 0
                    }
                }
            if(windup > 0){
                windup -= 0.5 //if not thinking about throwing, lower ball, won't get to this line if exited
            }
            if(st_position == 2){ //if keeper
                if(global.threedmode){
                    if((instance_nearest(x, y, obj_player_dummy).x < room_width/2-64) and instance_nearest(x, y, obj_player_dummy).ch_off_broom == false){
                        if(distance_to_point(scr_eligible_beater_teammate_location("x"), scr_eligible_beater_teammate_location("y")) > distance_to_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y)){
                            if(distance_to_point(732, y) > 8){
                                move_towards_point(732, y, moving_speed)
                                thoughts = "Danger. Move to keeper zone."
                            }else{
                                move_towards_point(x+8, y, 0)
                                thoughts = "Danger. Stay in keeper zone."
                            }
                        }
                    }
                }else{
                    if((instance_nearest(x, y, obj_player_dummy).y > room_height/2+48) and instance_nearest(x, y, obj_player_dummy).ch_off_broom == false){
                        if(distance_to_point(scr_eligible_beater_teammate_location("x"), scr_eligible_beater_teammate_location("y")) > distance_to_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y)){
                            if(distance_to_point(x, 528) > 8){
                                move_towards_point(x, 528, moving_speed)
                                thoughts = "Danger. Move to keeper zone."
                            }else{
                                move_towards_point(x, y-8, 0)
                                thoughts = "Danger. Stay in keeper zone."
                            }
                        }
                    }                
                }
            }
        }else{
            if distance_to_point(po_ox, po_oy) > 24{ // and thoughts != "QC is threatened; help"
                //mp_potential_step(po_ox, po_oy, moving_speed, true)
                if (global.threedmode == false and global.ballY - y < 96) or (global.threedmode == true and x - global.ballX < 96) and distance_to_point(po_ox, po_oy) > 24{ //reverse reverse
                    scr_move_offensive_position(po_ox, po_oy, moving_speed) //move_towards_point(po_ox, po_oy, moving_speed)
                    thoughts = "move to offensive position"
                }else{
                    move_towards_point(po_ox, po_oy, moving_speed-1)
                    thoughts = "move to offensive position slowly"
                }
            }
            //CHANGE LATER FOR THREEDMODE == FALSE
            if (abs(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x - global.ballX) + abs(instance_nearest(global.ballX, global.ballY, obj_player_dummy).y - global.ballY) < 24) and instance_nearest(global.ballX, global.ballY, obj_player_dummy).st_position < 4 and instance_nearest(global.ballX, global.ballY, obj_player_dummy).tackle == false and instance_nearest(x, y, obj_player_dummy).ch_off_broom == false{
                if (st_position < 3 and ch_ball == false and distance_to_point(global.ballX-32, global.ballY) < 64) or (ch_ball == true and st_position == 3){
                    thoughts = "QC is threatened; help!!!"
                    if(distance_to_point(global.ballX-32, global.ballY) < 24){ //24 instead of 8 to prevent pileups
                        move_towards_point(global.ballX-32, global.ballY, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0) 
                    }
                }            
            }
        }
        if instance_exists(obj_scuffle) == true{ //Own possession; am chaser evaluating scuffle
            if distance_to_point(po_dx, po_dy) > 4{
                move_towards_point(po_dx, po_dy, moving_speed)
            }else{
                move_towards_point(global.ballX, global.ballY, 0)
            }
            thoughts = "Ignore scuffle; Retreat"
            if (global.threedmode == false){
                if obj_scuffle.y > 448 and point_distance(po_dx,po_dy,scuffle.x,scuffle.y) < 64{
                    if(distance_to_point(obj_scuffle.x, obj_scuffle.y) > 16){
                        move_towards_point(obj_scuffle.x, obj_scuffle.y, moving_speed)
                        sprint = 1
                    }else{
                        sprint = 0
                        move_towards_point(obj_scuffle.x, obj_scuffle.y, 0)
                    }
                    thoughts = "Scuffle too close; Move in way!"
                }
            }else if instance_exists(obj_scuffle) == true{
                if obj_scuffle.x < 896 and point_distance(po_dx,po_dy, obj_scuffle.x, obj_scuffle.y) < 96{
                    if(distance_to_point(obj_scuffle.x, obj_scuffle.y) > 16){
                        move_towards_point(obj_scuffle.x, obj_scuffle.y, moving_speed)
                        sprint = 1
                    }else{
                        sprint = 0
                        move_towards_point(obj_scuffle.x, obj_scuffle.y, 0)
                    }
                    thoughts = "Scuffle too close; Move in way!"
                }                
            }
        }
        if instance_exists(obj_quaffle) and st_position < 3 and (instance_nearest(global.ballX, global.ballY, obj_player_teammate).x == x and instance_nearest(global.ballX, global.ballY, obj_player_teammate).y == y){
            sprint = 1
            move_towards_point(obj_quaffle.x, obj_quaffle.y, moving_speed)
            thoughts = "I am closest player to quaffle. Sprint on quaffle!!"
        }
    }
    if global.possession == 1 and st_position == 3{ //if quaffle in possession and you are a beater
        if ch_ball == true or po_noball == 1 or po_noball == 2{ //if you have a bludger OR your noball plan is 1 or 2
            if po_noball == 1 or po_noball == 2 and instance_exists(obj_bludger){
                //Shouldn't try to attain bludger if you already have a bludger!
                //thoughts = "Attain bludger, man!"
                //move_towards_point(instance_nearest(x,y, obj_bludger).x, instance_nearest(x,y, obj_bludger).y, moving_speed)            
            }
            if (global.threedmode == false and global.ballY > po_oy-24) or (global.threedmode == true and global.ballX < po_ox+24){
                if (global.threedmode == false and distance_to_point(global.ballX, global.ballY-24) > 4) or (global.threedmode == true and distance_to_point(global.ballX+24, global.ballY) > 4){ 
                    if global.threedmode == false{
                        move_towards_point(global.ballX, global.ballY-24, moving_speed)
                    }else{
                        move_towards_point(global.ballX+24, global.ballY, moving_speed)
                    }
                if(distance_to_point(global.ballX, global.ballY) < 24){ //may cause problems for vertical pitch
                    if(global.threedmode == false){
                        draw_direction = scr_balldirection();
                    }else{
                        draw_direction = 0
                        truedirection = 0
                        direction = 0
                    }
                    sprint = 0
                    if(instance_nearest(global.ballX, global.ballY, obj_player_dummy).speed == 0){
                        move_towards_point(instance_nearest(x, y, obj_player_teammate).x, instance_nearest(x, y, obj_player_teammate).y, 0)
                    }
                }
                thoughts = "Escort"
                if ch_ball == false{
                    thoughts = "Escort no ball"
                }
                
            if (global.threedmode == false and y < global.ballY-16) or (global.threedmode == true and x > global.ballX+16) and distance_to_point(global.ballX, global.ballY) > 64{
                sprint = 1
                thoughts = "Escort SPRINT"
                    }
                }else{
                //move_towards_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y, 0)
                    if (global.threedmode == false and distance_to_point(x, y-16) > 4) or (global.threedmode == true and distance_to_point(x+16, y) > 4){
                        if global.threedmode == false{
                            move_towards_point(x, y-16, moving_speed-1)
                        }else{
                            move_towards_point(x+16, y, moving_speed-1)
                        }
                    }else{
                        if global.threedmode == false{
                        move_towards_point(x, y-16, 0);
                        }else{
                        move_towards_point(x+16, y, 0);
                        }
                    }
                    //draw_direction = scr_balldirection();
                }
            }else{
                if po_withball == 0{ //stay back
                    if distance_to_point(po_dx, po_dy) > 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                    }
                    thoughts = "Far enough, move to defense"
                }
                if po_withball == 1 or po_noball == 1{ //escort
                    if (global.threedmode == false and global.ballY < po_oy+24) or (global.threedmode == true and global.ballX > po_ox-24){
                            if distance_to_point(po_dx, po_dy) > 16{
                                move_towards_point(po_dx, po_dy, moving_speed)
                            }else{
                                move_towards_point(global.ballX, global.ballY, 0)
                            }
                            thoughts = "Far enough, hold back"
                            if ch_ball == false{
                                move_towards_point(scr_beater_dummy_nearest_me(x, y, "x"), scr_beater_dummy_nearest_me(x, y, "y"), moving_speed)
                                thoughts = "Attack opposing beater!"
                            }
                        }else{
                            if (global.threedmode == false and distance_to_point(x, y-16) > 4) or (global.threedmode == true and distance_to_point(x+16, y) > 4){
                                if global.threedmode == false{
                                    move_towards_point(x, y-16, moving_speed-1)
                                }else{
                                    move_towards_point(x+16, y, moving_speed-1)
                                }
                            }else{
                                if global.threedmode == false{
                                move_towards_point(x, y-16, 0);
                                }else{
                                move_towards_point(x+16, y, 0);
                                }
                            }
                            if(global.threedmode == false){
                                draw_direction = scr_balldirection();
                            }else{
                                draw_direction = 0
                                truedirection = 0
                            }
                            thoughts = "Continue escort 'til po_ox/oy"                        
                        }
                    }
                if po_withball == 2{ //attack
                    if global.threedmode == false{
                        move_towards_point(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x, instance_nearest(global.ballX, global.ballY, obj_player_dummy).y, moving_speed)
                    }
                    thoughts = "Attack players nearest quaffle"
                }
                if po_withball == 3{ //1.5
                // should already be rolled back!
                thoughts = "ERROR, should not be accessed!"
                }
            }
            if ch_ball == true{
                if instance_exists(obj_bludger) and instance_nearest(x, y, obj_player_teammate).st_position == 3 and instance_nearest(x, y, obj_player_teammate).ch_ball == false{
                    if distance_to_object(obj_bludger) > 16{
                        move_towards_point(instance_nearest(x,y, obj_bludger).x, instance_nearest(x,y, obj_bludger).y, moving_speed)
                        thoughts = "Assist in bludger control"
                    }else{
                    move_towards_point(instance_nearest(x,y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y, 0)
                    thoughts = "Hover over bludger"
                        if distance_to_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y) < 64{
                            move_towards_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y, moving_speed)
                            thoughts = "Attack threat"
                        }
                    }
                }
                if(scr_ballwrapped() > 0) and distance_to_point(global.ballX, global.ballY) < 96{ //if my QC is wrapped, go in and help
                    move_towards_point(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x, instance_nearest(global.ballX, global.ballY, obj_player_dummy).y, moving_speed)
                    sprint = 1
                    thoughts = "QC wrapped, get over there."  + string(scr_ballwrapped())
                }
                if instance_exists(obj_scuffle){ //Own possession
                    if (global.threedmode == false and obj_scuffle.y > room_height/2) or (global.threedmode == true and obj_scuffle.x < room_width/2){
                        move_towards_point(obj_scuffle.x, obj_scuffle.y, moving_speed)
                        thoughts = "Beat scuffle"
                    }else{
                        if distance_to_point(po_dx, po_dy) < 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                        thoughts = "Ignore scuffle; Retreat"
                        }else{
                            move_towards_point(global.ballX, global.ballY, 0)
                        }
                    }
                }
                if distance_to_point(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x, instance_nearest(global.ballX, global.ballY, obj_player_dummy).y) < 48 and distance_to_point(global.ballX, global.ballY) < 80  and instance_nearest(global.ballX, global.ballY, obj_player_teammate).ch_off_broom == false{ // should also put player
                    thoughts = "QC in danger; throw?"
                    if(windup < 8){
                        windup += 1
                    }
                    if round(random_range (1, 8)) == 1{
                        global.throw = st_throw-2 //st_throw-2
                        global.accuracy = st_accuracy
                        throw_leway = 15
                        with(instance_nearest(global.ballX, global.ballY, obj_player_dummy)){
                        scr_set_moving_target_noball()
                        }
                        if(scr_is_target_dummy_beat(global.targetX, global.targetY) == false){ 
                            scr_throw_ball(obj_bludger, x, y, 7, 0)
                            ch_ball = false
                            exit
                        }
                    }
                }
                if(windup > 0){
                    windup -= 0.5 //if not thinking about throwing, lower ball, won't get to this line if exited
                }    
            }
        }else{ //if you don't have a bludger
            if instance_exists(obj_bludger){
            if thoughts != "Escort no ball" and thoughts != "Attack opposing beater!" and thoughts != "Attack opposing beater2"{
                    thoughts = "Attain bludger"
                    move_towards_point(instance_nearest(x,y, obj_bludger).x, instance_nearest(x,y, obj_bludger).y, moving_speed)
                }
                thoughts = "Attain bludger"
                move_towards_point(instance_nearest(x,y, obj_bludger).x, instance_nearest(x,y, obj_bludger).y, moving_speed)
            }else{ //if there is no bludger
                if po_noball == 0 or po_noball == 1{ //stay back
                    if distance_to_point(po_dx, po_dy) > 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                    }
                    thoughts = "No bludger; Ignore scuffle; Retreat"
                    //move_towards_point(scr_beater_dummy_nearest_me(x, y, "x"), scr_beater_dummy_nearest_me(x, y, "y"), moving_speed)
                    //thoughts = "Attack opposing beater!"
                }
                if po_noball == 2{
                    move_towards_point(instance_nearest(x, y, obj_team2bludgerwaypoint).x, instance_nearest(x, y, obj_team2bludgerwaypoint).y, moving_speed)
                    thoughts = "Move towards bludger"
                        if distance_to_point(obj_team2bludgerwaypoint.x, obj_team2bludgerwaypoint.y) < 32{
                            sprint = 1
                        }
                    thoughts = "Sprint on bludger!"
                }
            
            //OR, attack opposing beater?
            }
        }
    }
    if global.possession == 3{ //Friendly keeper getting ball
        if st_position == 2 and instance_exists(obj_quaffle){
            move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
            thoughts = "Start offense; pick up ball"
            }
        if st_position == 1{
            if distance_to_point(po_ox, po_oy+368) > 24{
                move_towards_point(po_ox, po_oy+368, moving_speed-1)
                thoughts = "Setup for offense"
            }else{
                move_towards_point(global.ballX, global.ballY, 0)
            }
        }
        if st_position == 3 and ch_ball == true{
            thoughts = "Cherry pick."
            /*if instance_exists(obj_player_test){
                if obj_player_test.y < room_height/2{
                    move_towards_point(obj_player_test.x, obj_player_test.y, moving_speed)
                }
            }else{*/ //Keeping lines consistent
                if (global.threedmode == false and instance_nearest(x, y, obj_player_dummy).y > room_height/2) or (global.threedmode == true and instance_nearest(x, y, obj_player_dummy).x < room_width/2){
                    sprint = 1
                    move_towards_point((instance_nearest(x,y, obj_player_dummy)).x, (instance_nearest(x,y, obj_player_dummy)).y, moving_speed)
                }else{
                    if distance_to_point(po_dx, po_dy) > 4{
                        move_towards_point(po_dx, po_dy, moving_speed)
                        thoughts = "Move to defense."
                    }else{
                        move_towards_point(global.ballX, global.ballY, 0)
                        thoughts = "At defense, stare at ball."
                    }
                //} keeping lines consistent ITS FINE I PROMISE DONT WORRY
            if instance_exists(obj_player_dummy) and distance_to_object(obj_player_dummy) < 16 and instance_nearest(x, y, obj_player_dummy).ch_off_broom == false and ch_ball == true{
                thoughts = "They're close; Throw bludger?"
                if(windup < 8){
                    windup += 1
                }
                if round(random_range(1, 8)) == 1{
                    global.throw = 4 //st_throw-2
                    global.accuracy = st_accuracy
                    global.targetX = instance_nearest(x, y, obj_player_dummy).x
                    global.targetY = instance_nearest(x, y, obj_player_dummy).y 
                    global.targetSpeed = instance_nearest(x, y, obj_player_dummy).speed
                    global.targetDirection = instance_nearest(x, y, obj_player_dummy).speed
                    throw_leway = 15
                    if(scr_is_target_dummy_beat(global.targetX, global.targetY) == false){ 
                        scr_throw_ball(obj_bludger, x, y, 7, 0)
                        ch_ball = false
                        exit
                    }
                }
            }
            if instance_exists(obj_player2_test){
                if distance_to_object(obj_player2_test) < 16{ //TAKEN FROM SCR_DUMMY 05/22/2017
                    if obj_player2_test.ch_off_broom == false{
                        thoughts = "They're close; Throw bludger?"
                        if(windup < 8){
                            windup += 1
                        }
                        if round(random_range(1, 8)) == 1{
                            global.throw = 4 //st_throw-2
                            global.accuracy = st_accuracy
                            throw_leway = 15
                            if(scr_is_target_dummy_beat(obj_player2_test.x, obj_player2_test.y) == false){ 
                                scr_throw_ball(obj_bludger, x, y, 7, 0) //In scr_dummy_step the throwtype is different than the throw 10 lines above
                                ch_ball = false
                                exit
                            }
                        }
                    }
                }
            }
        }
        if(windup > 0){
            windup -= 0.5 //if not thinking about throwing, lower ball, won't get to this line if exited
        }    
    }
    if st_position == 3 and ch_ball == false{
            if instance_exists(obj_bludger){
                thoughts = "Attain bludger"
                move_towards_point(instance_nearest(x,y, obj_bludger).x, instance_nearest(x,y, obj_bludger).y, moving_speed)
            }else{
                if distance_to_point(po_dx, po_dy) > 4{
                    move_towards_point(po_dx, po_dy, moving_speed)
                }else{
                    move_towards_point(global.ballX, global.ballY, 0)
                }
                thoughts = "No bludger; Ignore scuffle; Retreat"            
                //OR find beater buddy?
        }
    }
}        
    if global.possession == 4{ //Opposing keeper getting ball
        if st_position == 3 and ch_ball == true{
            if distance_to_point(po_dx, po_dy) > 6{
                move_towards_point(po_dx, po_dy, moving_speed)
            }else{
                move_towards_point(global.ballX, global.ballY, 0) //originally, just stop
                }
            thoughts = "Move to defensive position"
            }
        if st_position < 3{
            if distance_to_point(po_dx, po_dy) > 6{
                move_towards_point(po_dx, po_dy, moving_speed)
            }else{
                move_towards_point(global.ballX, global.ballY, 0) //originally, just stop
                }
            thoughts = "Move to defensive position"
            }

        }

    if st_position == 3 and ch_ball == true{ //if quaffle free?
        if global.possession == 0{ //was changed from 1 to 0 11/24
            if instance_exists(obj_quaffle) == true{
                if distance_to_point(obj_quaffle.x, obj_quaffle.y) > 20 and distance_to_point(obj_quaffle.x, obj_quaffle.y) < 256{
                    if distance_to_point(obj_quaffle.x, obj_quaffle.y) > 24{
                        move_towards_point(obj_quaffle.x, obj_quaffle.y-12, moving_speed)
                    }else{
                        move_towards_point(instance_nearest(x, y, obj_player_dummy).x, instance_nearest(x, y, obj_player_dummy).y, 0)
                    }
                    thoughts = "I am close, guard quaffle"
                    if distance_to_point(instance_nearest(global.ballX, global.ballY, obj_player_dummy).x, instance_nearest(global.ballX, global.ballY, obj_player_dummy).y) < 64 and distance_to_point(global.ballX, global.ballY) < 80{ // should also put player
                        thoughts = "Throw before they get it?"
                        if(windup < 8){
                            windup += 1
                        }
                        if round(random_range (1, 8)) == 1{
                            global.throw = st_throw
                            global.accuracy = st_accuracy
                            throw_leway = 15
                            with(instance_nearest(global.ballX, global.ballY, obj_player_dummy)){
                            scr_set_moving_target_noball()
                            }
                            if(scr_is_target_dummy_beat(global.targetX, global.targetY) == false){ 
                                scr_throw_ball(obj_bludger, x, y, 7, 0)
                                ch_ball = false
                                exit
                            }
                        }
                    }
                }
            }else{
                if distance_to_point(obj_center_opp.x, obj_center_opp.y-112) > 16{
                    move_towards_point(obj_center_opp.x, obj_center_opp.y-112, moving_speed)
                    thoughts = "Move above center hoop"
                }
                if distance_to_point(obj_center_opp.x, obj_center_opp.y-112) < 32{
                    move_towards_point(global.ballX, global.ballY, 0)
                    thoughts = "Look at quaffle"
                }
                if distance_to_point(obj_center_opp.x, obj_center_opp.y-112) > 32{
                    move_towards_point(obj_center_opp.x, obj_center_opp.y-112, moving_speed)
                    thoughts = "Move above center hoop"
                }else{
                    move_towards_point(global.ballX, global.ballY, 0)
                    thoughts = "Look at quaffle"
                }
                if instance_exists(obj_scuffle) == true{
                    if distance_to_point(obj_scuffle.x, obj_scuffle.y) < 256{
                    move_towards_point(obj_scuffle.x, obj_scuffle.y, moving_speed) //sprint?
                    sprint = 1
                    thoughts = "Sprint to scuffle"
                    }
                }
            }
        }
        if instance_exists(obj_player2_test) == true and distance_to_point(global.ballX, global.ballY) < 160 and global.possession == 2{
            if obj_player2_test.ch_ball == true{
                thoughts = "Throw bludger?"
                if(windup < 8){
                    windup += 1
                }
                if round(random_range(1, 8)) == 1{
                    global.throw = st_throw
                    global.accuracy = st_accuracy
                    throw_leway = 15
                    if(scr_is_target_teammate_beat(obj_player2_test.x, obj_player2_test.y) == false){ 
                        scr_throw_ball(obj_bludger, x, y, 16, 0) //the throwtype is different than the throw 10 lines above" in scr_teammate_step: make consistent. Other script uses a throwType specifically for player and this uses the default one to throw at AI
                        ch_ball = false
                        exit
                    }
                }
            }
        }
        if ((global.threedmode == false and (global.ballY > y - 32 and distance_to_point(global.ballX, global.ballY) < 160 or abs(global.ballY - obj_center_opp.y) < 80))
        or (global.threedmode == true and (global.ballX < x + 32 and distance_to_point(global.ballX, global.ballY) < 160 or abs(global.ballX - obj_center_opp.x) < 80))) and global.possession == 2
        and ch_ball == true and instance_exists(obj_scuffle) == false{
            thoughts = "Throw bludger at point?"
            if(windup < 8){
                windup += 1
            }
            if round(random_range (1, 8)) == 1{
                global.throw = st_throw
                global.accuracy = st_accuracy
                throw_leway = 15
                with(obj_player2_test){ //scr_set_moving target makes sure the ONLY QUAFFLE CARRIER sets itself as the moving target, so this won't cause an error
                    scr_set_moving_target()
                }
                with(obj_player_dummy){
                    scr_set_moving_target()
                }
                if(scr_is_target_dummy_beat(global.targetX, global.targetY) == false){ 
                    scr_throw_ball(obj_bludger, x, y, 7, 0)
                    ch_ball = false
                    exit
                }
            }
        }
        if instance_exists(obj_player2_test) and distance_to_object(obj_player2_test) < 16 and ch_ball == true and (global.possession != 2 and global.ballY > room_height/2){
            if obj_player2_test.ch_off_broom == false{
                thoughts = "They're close; Throw bludger?"
                if(windup < 8){
                    windup += 1
                }
                if round(random_range(1, 8)) == 1{
                    global.throw = 4 //st_throw-2
                    global.accuracy = st_accuracy
                    throw_leway = 15
                    if(scr_is_target_teammate_beat(obj_player2_test.x, obj_player2_test.y) == false){ 
                        scr_throw_ball(obj_bludger, x, y, 16, 0)
                        ch_ball = false
                        exit
                    }
                }
            }
        }
        if instance_exists(obj_player_dummy) and distance_to_object(obj_player_dummy) < 16 and instance_nearest(x, y, obj_player_dummy).ch_off_broom == false and ch_ball == true and global.possession != 4{
            thoughts = "They're close; Throw bludger?"
            if(windup < 8){
                windup += 1
            }
            if round(random_range(1, 8)) == 1{
                global.throw = 4 //st_throw-2
                global.accuracy = st_accuracy
                global.targetX = instance_nearest(x, y, obj_player_dummy).x
                global.targetY = instance_nearest(x, y, obj_player_dummy).y 
                global.targetSpeed = instance_nearest(x, y, obj_player_dummy).speed
                global.targetDirection = instance_nearest(x, y, obj_player_dummy).speed
                throw_leway = 15
                if(scr_is_target_dummy_beat(global.targetX, global.targetY) == false){ 
                    scr_throw_ball(obj_bludger, x, y, 7, 0)
                    ch_ball = false
                    exit
                }
            }
        }
        if instance_exists(obj_quaffle) and distance_to_object(obj_quaffle) < 24 and ch_ball == true  and global.possession != 1{
            if obj_quaffle.speed > 3{
                thoughts = "Throw bludger at quaffle?"
                if(windup < 8){
                    windup += 1
                }
                if round(random_range(1, 512)) <= st_accuracy{
                    global.throw = st_throw
                    global.accuracy = st_accuracy
                    ch_ball = false
                    throw_leway = 15
                    scr_throw_ball(obj_bludger, x, y, 8, 0)
                    exit
                }
            }
        }
        if instance_exists(obj_scuffle){
            if distance_to_object(instance_nearest(obj_scuffle.x, obj_scuffle.y, obj_player_dummy)) < 24 and ch_ball == true{
                thoughts = "Throw bludger at scuffle?"
                if(windup < 8){
                    windup += 1
                }
                if round(random_range(1, 4)) == 1{
                    global.throw = 4
                    global.accuracy = st_accuracy
                    throw_leway = 15
                    global.targetX = instance_nearest(obj_scuffle.x, obj_scuffle.y, obj_player_dummy).x
                    global.targetY = instance_nearest(obj_scuffle.x, obj_scuffle.y, obj_player_dummy).y+12
                    global.targetSpeed = 0
                    global.targetDirection = 0
                    if(scr_is_target_dummy_beat(global.targetX, global.targetY-12) == false){ 
                        scr_throw_ball(obj_bludger, x, y, 7, 0)
                        ch_ball = false
                        exit
                    }
                }
            }
        }
        if(windup > 0){
            windup -= 0.5 //if not thinking about throwing, lower ball, won't get to this line if exited
        }    
    }
    if st_position == 3 and global.team1onseeker == 1 and instance_exists(obj_snitch) and obj_snitch.snitchonpitch == true{
        if instance_exists(obj_snitch_grab) == true{
        sprint = 1
        }
        if ch_ball == true{
            if distance_to_point(obj_snitch.x, obj_snitch.y) < 64{
                sprint = 1
                if(scr_is_target_teammate_beat(global.seeker2x, global.seeker2y)) and distance_to_point(global.seeker2x, global.seeker2y) >= 32{ //if the other seeker isn't beat, move in front of them
                    thoughts = "opposing seeker not beat, move in between them at snitch"
                    move_towards_point((obj_snitch.x+global.seeker2x)/2, (obj_snitch.y+global.seeker2y)/2, moving_speed)
                }else if(distance_to_point(global.seeker2x, global.seeker2y) < 64) and (scr_is_target_dummy_beat(global.seeker2x, global.seeker2y) == false){ //if the other seeker isn't beat, and clsoe enougb, beat them
                    thoughts = "opposing seeker close, attack them"
                    move_towards_point(global.seeker2x, global.seeker2y, moving_speed)
                    if(distance_to_point(global.seeker2x, global.seeker2y)) < 24{
                        thoughts = "Throw bludger at seeker?"
                        if(windup < 8){
                            windup += 1
                        }
                        if round(random_range(1, 4)) == 1{
                            global.throw = 4
                            global.accuracy = st_accuracy
                            throw_leway = 15
                            global.targetX = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x
                            global.targetY = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).y+12
                            global.targetSpeed = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x
                            global.targetDirection = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x
                            if(scr_is_target_teammate_beat(global.targetX, global.targetY) == false){ 
                                scr_throw_ball(obj_bludger, x, y, 9, 0)
                                ch_ball = false
                                exit
                            }
                        }                    
                    }
                }else if(distance_to_object(obj_player_teammate) < 64){
                    thoughts = "Opposing player near my seeker, attack!"
                    move_towards_point(instance_nearest(global.seeker1x, global.seeker1y, obj_player_teammate).x, instance_nearest(global.seeker1x, global.seeker1y, obj_player_teammate).y, moving_speed)
                    if(distance_to_point(instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x, instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).y) < 24){
                        thoughts = "Throw bludger at nearby opponent?"
                        if(windup < 8){
                            windup += 1
                        }
                        if round(random_range(1, 8)) == 1{
                            global.throw = 4
                            global.accuracy = st_accuracy
                            throw_leway = 15
                            global.targetX = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x
                            global.targetY = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).y+12
                            //global.targetSpeed = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x
                            //global.targetDirection = instance_nearest(global.seeker2x, global.seeker2y, obj_player_teammate).x
                            global.targetSpeed = 0
                            global.targetDirection = 0
                            if(scr_is_target_teammate_beat(global.targetX, global.targetY) == false){ 
                                scr_throw_ball(obj_bludger, x, y, 9, 0)
                                ch_ball = false
                                exit
                            }
                        }                    
                    }
                }else{ //no enemies nearby, but close to seeker and snitch
                    thoughts = "Move between snitch and their hoops"
                    sprint = 0
                    if(distance_to_point((obj_snitch.x*4+instance_nearest(obj_snitch.x, obj_snitch.y, obj_baby_score).x)/5,  (obj_snitch.y*4+instance_nearest(obj_snitch.x, obj_snitch.y, obj_baby_score).y)/5) > 8){
                        move_towards_point((obj_snitch.x*4+instance_nearest(obj_snitch.x, obj_snitch.y, obj_baby_score).x)/5, (obj_snitch.y*4+instance_nearest(obj_snitch.x, obj_snitch.y, obj_baby_score).y)/5, moving_speed)
                    }else{
                        move_towards_point(instance_nearest(x, y, obj_player_teammate).x, instance_nearest(x, y, obj_player_teammate).y, 0)
                    }
                }
            }else{
                sprint = 1
                move_towards_point(obj_snitch.x, obj_snitch.y, moving_speed)
            }
            thoughts = "Go to snitch"
        }else{
            sprint = 1
            move_towards_point(scr_beater_teammate_nearest_me(x, y, "x"), scr_beater_teammate_nearest_me(x, y, "y"), moving_speed)
            thoughts = "Attack beater to get bludger"
        }
    }
    //catchall, if I don't have a bludger, get the nearest bludger!
    if st_position == 3 and ch_ball == false and instance_exists(obj_bludger){
        move_towards_point(instance_nearest(x, y, obj_bludger).x, instance_nearest(x, y, obj_bludger).y, moving_speed)
        thoughts = "Attain bludger"
        }
    }

if drag == 1{
    if(instance_exists(obj_player_dummy)){
        if(distance_to_point(global.ballX, global.ballY)) > 3{
            move_towards_point(global.ballX, global.ballY, instance_nearest(x, y, obj_player_dummy).moving_speed)
        }else{
            move_towards_point(global.ballX, global.ballY, 0)
        }
    }else{
        move_towards_point(global.ballX, global.ballY, 0)
    }
}

if(instance_exists(obj_player_dummy)){
    if(instance_exists(obj_quaffle)) or distance_to_object(obj_player_dummy) > 4{
        drag = 0
    }
}

if ch_off_broom == true and tackle == false and scuffling == false{
    if ch_broom_drop == false{
        move_towards_point(instance_nearest(x, y, obj_baby_score_opp).x, instance_nearest(x, y, obj_baby_score_opp).y, moving_speed)
        thoughts = "Back to hoops"
    }else{
        move_towards_point(instance_nearest(x, y, obj_broom).x, instance_nearest(x, y, obj_broom).y, moving_speed)
        thoughts = "Retrieve broom"
    }
}

if tackle == true{
    jumping = false
    if speed > 0{
    speed = -.5
    }else{
    speed = 0
    }
    if scuffling == false and round(random_range(1, 30)) == 1{
        tackle = false
    }
    if global.possession == 3 and st_position == 2{
        tackle = false
    }
    if st_position == 4 and round(random_range(1, 30)) == 1{ //failsafe for seekers
        tackle = false
    }
}
/*if stiffarmed == true{
    if instance_exists(obj_player2_test){
        move_towards_point(obj_player2_test.x, obj_player2_test.y, -1*((obj_player2_test.st_power/5)+1))
    }
    if distance_to_object(obj_player_test) > 4{
    stiffarmed = false
    }
}*/
if scuffling == true{
    if instance_exists(obj_scuffle) and st_position != 4{
        move_towards_point(obj_scuffle.x, obj_scuffle.y, 0)
    }
    if ch_off_broom == true{
        scuffling = false
        with(obj_player_dummy){
            scr_scuffle_award()
        }
        with(obj_player2_test){
            scr_scuffle_award()
        }
        with(obj_scuffle){
            instance_destroy()
        }
        if instance_exists(obj_snitch_grab) == false and st_position == 4{
            with(obj_snitch_grab){
            instance_destroy()
            }
        }
    }
    if instance_exists(obj_snitch_grab) == true and st_position == 4{
        if instance_exists(obj_scuffle){
            move_towards_point(obj_scuffle.x, obj_scuffle.y, 0)
        }
        if instance_exists(obj_snitch_grab){
            if distance_to_object(obj_snitch) > 8{
                move_towards_point(obj_snitch.x, obj_snitch.y, 3)
            }
            if distance_to_object(obj_snitch) < 9 and distance_to_object(obj_snitch) > 2{
                move_towards_point(obj_snitch.x, obj_snitch.y, 1)
            }
            if distance_to_object(obj_snitch) < 3{
                move_towards_point(obj_snitch.x, obj_snitch.y, 0)
            }
        }
        if tackle == true{
            scuffling = false
            with obj_snitch_grab{
            instance_destroy()
            }
        }
    }    
}
if sprint == 1 {
    if st_energy < 1{
        sprint = 0
        st_energy = 0
    }else{
        instance_create(x, y+16, obj_dirt_particle)
        st_energy = st_energy-10+st_stamina/1.5    
    }
    /*if distance_to_object(obj_player_test) > 64 and distance_to_object(obj_player_teammate) < 64 == false and ch_ball = true{
        sprint = false
    }*/
}

if (argument0 == 0){
    if distance_to_object(obj_bludger) < 32 and round(random_range(1, 10-st_awareness)){
        if ch_ball == true and speed > 0{ //if within my view and other team bludger, block it
            if((instance_nearest(x, y, obj_bludger).friendlyteam == 2)) and (abs(point_direction(x, y, instance_nearest(x, y, obj_bludger).x, instance_nearest(x, y, obj_bludger.y) - direction)) < 90)  and (instance_nearest(x, y, obj_bludger).speed > 0){
                blocking = true
            }
        }
    }else{
        if st_position != 4  and argument0 == 0{
            blocking = false
        }
    }
}

if st_position == 3 and instance_exists(obj_bludger) and global.possession != -1{
    if ch_ball == false and scr_check_bludger_teammate() and scr_check_closest_beater_teammate() and obj_bludger.speed < 1
    {
        ch_immunity = true;
    }else{
        ch_immunity = false;
    }
}else{
    ch_immunity = false;
}

if instance_exists(obj_player_test) == false and ch_ball == true and st_position < 3{
    if st_position == 1{
        global.playername = ch_name + " - Chaser"
    }
    if st_position == 2{
        global.playername = ch_name + " - Keeper"
    }
}

if immunitycount > 0{
immunitycount -= 1
}

if distance_to_object(obj_baby_score_opp) > 32{
    if jumping == true{
        jumping = false
        speed = 0;
    }
}

if st_position == 3 and distance_to_object(obj_team1bludgerwaypoint) > 4{
    instance_create(x, y, obj_team1bludgerwaypoint)
}

if jumping == true{
    move_towards_point(jumpX, jumpY, st_power + 3)
    thoughts = "JUMP"
    if distance_to_point(jumpX, jumpY) < 8{
        jumping = false
        speed = 0
        move_towards_point(mouse_x, mouse_y, 0)
    }
}

if instance_exists(obj_quaffle) and st_position < 3 and throw_leway == 0 and ch_off_broom == false and tackle == false{ //catch quaffle
    if obj_quaffle.speed > 1{
        if distance_to_object(obj_quaffle) < st_catching/2+2{
            if irandom_range(1, distance_to_object(obj_quaffle)*5) == 1{
            //obj_quaffle.x = x;
            //obj_quaffle.y = y;
            //action_create_object_motion(obj_exclam, x, y, 6, 0);
            }
        }
    }
}

if(ch_ball == false){
    if(windup > 0){
        windup -= 1
    }
    if(windup < 0){
        windup = 0
    }
}

if(room == rm_prepitch_alt){
    speed = 0
}

image_speed = speed/6

if speed == 0{
    image_speed = 0
}

//have player influence movement

if(instance_exists(obj_player2_test)){
    if(obj_player2_test.drag != 0 and drag == 0 and ch_ball == true){
        if(global.wasd == true){
            if(keyboard_check_direct(ord("A"))){ //LEFT
                if global.threedmode == false{
                    hspeed -= (obj_player2_test.st_power*.1)
                }else{
                    hspeed -= (obj_player2_test.st_power*.1)
                }
            }
            if(keyboard_check_direct(ord("W"))){ //UP
                if global.threedmode == false{
                    vspeed -= (obj_player2_test.st_power*.1)
                }else{
                    vspeed -= (obj_player2_test.st_power*.1)
                }
            }
        }else{ //if wasd = false ---> ZQSD
            if(keyboard_check_direct(ord("Q"))){ //LEFT
                if global.threedmode == false{
                    hspeed -= (obj_player2_test.st_power*.1)
                }else{
                    hspeed -= (obj_player2_test.st_power*.1)
                }
            }
            if(keyboard_check_direct(ord("Z"))){ //UP
                if global.threedmode == false{
                    vspeed -= (obj_player2_test.st_power*.1)
                }else{
                    vspeed -= (obj_player2_test.st_power*.1)
                }
            }
        }
        //WASD AND ZQSD use D and S the same way
        if(keyboard_check_direct(ord("D"))){ //RIGHT
                if global.threedmode == false{
                    hspeed += (obj_player2_test.st_power*.1)
                }else{
                    hspeed += (obj_player2_test.st_power*.1)
                }
        }
        if(keyboard_check_direct(ord("S"))){ //DOWN
                if global.threedmode == false{
                    vspeed += (obj_player2_test.st_power*.1)
                }else{
                    vspeed += (obj_player2_test.st_power*.1)
                }
        }
    }
}
