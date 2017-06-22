//Brooms up: 52
//Quaffle free: 95
//Defense: 211
//Offense: 351 (ball carrier); 540 (beater)
//Own keeper recover: 617
//Opposing keeper recover: 684

if(global.paused == true){
    image_speed = 0
    exit
}else{
    image_speed = speed/6
}

if ch_off_broom == true and tackle == false and scuffling == false{
    if ch_broom_drop == false{
            move_towards_point(instance_nearest(x, y, obj_baby_score_opp).x, instance_nearest(x, y, obj_baby_score_opp).y, moving_speed)
        //thoughts = "Back to hoops"
    }else{
        move_towards_point(instance_nearest(x, y, obj_broom).x, instance_nearest(x, y, obj_broom).y, moving_speed)
        //thoughts = "Retrieve broom"
    }
}

if(abs((prev_direction+360) - (twoback_direction+360)) < 90) and (abs((direction+360) - (prev_direction+360)) < 90){ //prevents vibration
    /*draw_direction = direction
    draw_direction = (prev_direction + twoback_direction + direction)/3*/
    draw_direction = direction
    draw_direction = (twoback_direction + prev_direction*2 + direction*3)/6 //makes motion look more fluid
    if(blocking == true){
        if(instance_exists(obj_bludger)){
            move_towards_point(obj_bludger.x, obj_bludger.y-12, 0) //just to change direction; should be overriden later after draw_direction is established
            draw_direction = direction;
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

if(global.paused == false and drag == 0){
    if(distance_to_point(commandX, commandY) < 16){
        move_towards_point(obj_player_test.x, obj_player_test.y, 0)
    }else{
        move_towards_point(commandX, commandY, moving_speed)
    }
}

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

if room != rm_pitch and room != rm_alt and room != rm_test and room != rm_online_pitch{
    exit
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

if(instance_exists(obj_player_test)){
    if(obj_player_test.drag != 0 and drag == 0 and ch_ball == true){
        if(global.wasd == true){
            if(keyboard_check_direct(ord("A"))){ //LEFT
                if global.threedmode == false{
                    hspeed -= (obj_player_test.st_power*.2)
                }else{
                    hspeed -= (obj_player_test.st_power*.2)
                }
            }
            if(keyboard_check_direct(ord("W"))){ //UP
                if global.threedmode == false{
                    vspeed -= (obj_player_test.st_power*.2)
                }else{
                    vspeed -= (obj_player_test.st_power*.2)
                }
            }
        }else{ //if wasd = false ---> ZQSD
            if(keyboard_check_direct(ord("Q"))){ //LEFT
                if global.threedmode == false{
                    hspeed -= (obj_player_test.st_power*.2)
                }else{
                    hspeed -= (obj_player_test.st_power*.2)
                }
            }
            if(keyboard_check_direct(ord("Z"))){ //UP
                if global.threedmode == false{
                    vspeed -= (obj_player_test.st_power*.2)
                }else{
                    vspeed -= (obj_player_test.st_power*.2)
                }
            }
        }
        //WASD AND ZQSD use D and S the same way
        if(keyboard_check_direct(ord("D"))){ //RIGHT
                if global.threedmode == false{
                    hspeed += (obj_player_test.st_power*.2)
                }else{
                    hspeed += (obj_player_test.st_power*.2)
                }
        }
        if(keyboard_check_direct(ord("S"))){ //DOWN
                if global.threedmode == false{
                    vspeed += (obj_player_test.st_power*.2)
                }else{
                    vspeed += (obj_player_test.st_power*.2)
                }
        }
    }
}
