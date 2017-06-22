//argument0 = team; 1 = user/player1's team; 2 = opponent/player2's team

//Movement

if(global.paused == true){
    image_speed = 0
    exit
}

image_speed = speed/6 //animate speed based on running speed

//When off broom, the player returns to hoops to tag back in. Movement is not able to be influenced by the player 

if ch_off_broom == true and tackle == false and scuffling == false{
    if ch_broom_drop == false{
        if(argument0 != 1){
            move_towards_point(instance_nearest(x, y, obj_baby_score).x, instance_nearest(x, y, obj_baby_score).y, moving_speed)
        }else{
            move_towards_point(instance_nearest(x, y, obj_baby_score_opp).x, instance_nearest(x, y, obj_baby_score_opp).y, moving_speed)
        }
        //thoughts = "Back to hoops"
    }else{
        move_towards_point(instance_nearest(x, y, obj_broom).x, instance_nearest(x, y, obj_broom).y, moving_speed)
        //thoughts = "Retrieve broom"
    }
}

//

if(st_position < 3 and ch_ball == true){
    global.possession = argument0
}

////////////////////////////////////////////////
//Shift; turning on SPRINT variable/////////////
////////////////////////////////////////////////

if(keyboard_check_direct(vk_shift)){
    if st_energy > (10+st_stamina/1.5) and tackle == false and scuffling == false{
        //st_energy -= 10+st_stamina/1.5
        //instance_create(x, y+16, obj_dirt_particle)
        sprint = 1
    }else{
        sprint = 0
    }
}else{
    sprint = 0
}

//when no buttons are held down, the player looks towards the mouse

    if(drag != 0){ //stay locked onto the player you're wrapping
        if(ch_ball == false){
            if distance_to_point(global.ballX, global.ballY) >= 16{
                if(argument0 == 1){
                    if(global.threedmode){
                        move_towards_point(global.ballX-4, global.ballY+2, moving_speed)
                        //x = global.ballX-4
                        //y = global.ballY+2
                    }else{
                        move_towards_point(global.ballX, global.ballY+2, moving_speed)
                        //x = global.ballX
                        //y = global.ballY+2
                    }
                }else{
                    if(global.threedmode){
                        move_towards_point(global.ballX+4, global.ballY+2, moving_speed)
                        //x = global.ballX+4
                        //y = global.ballY+2
                    }else{
                        move_towards_point(global.ballX-4, global.ballY-2, moving_speed)
                        //x = global.ballX
                        //y = global.ballY-2
                    }                
                }
                
            }
            if (distance_to_point(global.ballX, global.ballY) < 16){
                x = global.ballX-4*(cos(degtorad(contact_direction)))
                y = global.ballY+4*(sin(degtorad(contact_direction)))+1
                /*
                if(argument0 == 1){
                    if(global.threedmode){
                        x = global.ballX-4
                        y = global.ballY+2
                    }else{
                        x = global.ballX
                        y = global.ballY+2
                    }
                }else{
                    if(global.threedmode){
                        x = global.ballX+4
                        y = global.ballY+2
                    }else{
                        x = global.ballX
                        y = global.ballY-2
                    }                
                }*/
            }
        }
    }

////////////////////////////////////////////////
//WASD and ZQSD; Movement //////////////////////
////////////////////////////////////////////////    

    if(jumping == false and tackle == false and ch_off_broom == false and scuffling == false){
        if(global.wasd == true){
            if(keyboard_check_released(ord("W")) or keyboard_check_released(ord("A")) or keyboard_check_released(ord("S")) or keyboard_check_released(ord("D"))){
                speed = 0
            }
            if(keyboard_check_direct(ord("W")) or keyboard_check_direct(ord("A")) or keyboard_check_direct(ord("S")) or keyboard_check_direct(ord("D"))) == false{
                move_towards_point(mouse_x, mouse_y, 0)
            }
        }else{
            if(keyboard_check_released(ord("Z")) or keyboard_check_released(ord("Q")) or keyboard_check_released(ord("S")) or keyboard_check_released(ord("D"))){
                speed = 0
            }
            if(keyboard_check_direct(ord("Z")) or keyboard_check_direct(ord("Q")) or keyboard_check_direct(ord("S")) or keyboard_check_direct(ord("D"))) == false{
                move_towards_point(mouse_x, mouse_y, 0)
            }
        }
    }
    
    //WASD
    
    if(jumping == false and tackle == false and ch_off_broom == false and scuffling == false and (drag == 0 or ch_ball == true or true)){
    
        if(global.wasd == true){
            if(keyboard_check_direct(ord("A"))){ //LEFT
                if global.threedmode == false{
                    if position_empty(x-2-(st_speed*.1+sprint), y){
                        hspeed = drag-2-(st_speed*.1+sprint)
                    }
                }else{
                    hspeed = drag-2-(st_speed*.1+sprint)
                }
            }
            if(keyboard_check_direct(ord("W"))){ //UP
                if global.threedmode == false{
                    if position_empty(x, y-2-(st_speed*.1+sprint)){
                        vspeed = drag-2-(st_speed*.1+sprint)
                    }
                }else{
                    vspeed = drag-2-(st_speed*.1+sprint)
                }
            }
        }else{ //if wasd = false ---> ZQSD
            if(keyboard_check_direct(ord("Q"))){ //LEFT
                if global.threedmode == false{
                    if position_empty(x-2-(st_speed*.1+sprint), y){
                        hspeed = drag-2-(st_speed*.1+sprint)
                    }
                }else{
                    hspeed = drag-2-(st_speed*.1+sprint)
                }
            }
            if(keyboard_check_direct(ord("Z"))){ //UP
                if global.threedmode == false{
                    if position_empty(x, y-2-(st_speed*.1+sprint)){
                        vspeed = drag-2-(st_speed*.1+sprint)
                    }
                }else{
                    vspeed = drag-2-(st_speed*.1+sprint)
                }
            }
        }
        //WASD AND ZQSD use D and S the same way
        if(keyboard_check_direct(ord("D"))){ //RIGHT
            if global.threedmode == false{
                if position_empty(x+2+(st_speed*.1+sprint), y){
                    hspeed = drag+2+(st_speed*.1+sprint)
                }
            }else{
                hspeed = drag+2+(st_speed*.1+sprint)
            }
        }
        if(keyboard_check_direct(ord("S"))){ //DOWN
            if global.threedmode == false{
                if position_empty(x, y+2+(st_speed*.1+sprint)){
                    vspeed = drag+2+(st_speed*.1+sprint)
                }
            }else{
                vspeed = drag+2+(st_speed*.1+sprint)
            }
        }
    }
    
    if(global.threedmode == false){
        hspeed = 0.8*hspeed
        vspeed = 0.8*vspeed
    }

////////////////////////////////////////////////
//Mouse; Throwing balls and blocking actions////
////////////////////////////////////////////////

if blocking = false and mouse_check_button(mb_right) == false{
    if mouse_check_button(mb_left){
        blocking = false
        if(ch_power < 1){
            ch_power += 0.02
        }
        truedirection = point_direction(x, y, mouse_x, mouse_y)
        /*if(windup < 9){
            windup += 1
        }*/
        windup = (ch_power*9)-4.5 //when ch_power is 1, windup should be 9
    }else{
        if(windup > 0){
            windup -= 1;
        }
    }
}

//Blocking/Kicking. Player kicks balls when blocking == true

if mouse_check_button(mb_right){
    if(blocking == false){
        blocking = true
    }
    ch_power = .5
    windup = 0
}

//Jumping. Player is able to dive to places within the keeper zone quickly by pressing the right mouse button

if mouse_check_button_pressed(mb_right){
    if (distance_to_object(obj_baby_score_opp)) < 32{
        if(st_position == 2){
            if(global.threedmode == false){
                if(mouse_x < obj_smedium_opp.x+48) and (mouse_x > obj_baby_opp.x-48) and (mouse_y > obj_baby_score_opp.y-48) and (mouse_y < obj_baby_score_opp.y+48){
                    jumping = true
                    jumpX = mouse_x
                    jumpY = mouse_y
                    move_towards_point(jumpX, jumpY, st_power+3)
                }
            }else{
                if(mouse_x < obj_althoop_smedium_opp.x+64) and (mouse_x > obj_althoop_baby_opp.x-64) and (mouse_y > obj_althoop_smedium_opp.y-48) and (mouse_y < obj_althoop_baby_opp.y+48){
                    jumping = true
                    jumpX = mouse_x
                    jumpY = mouse_y
                    move_towards_point(jumpX, jumpY, st_power+3)
                }            
            }
        }
    }
}

//Player "winds up" throw, throwing further the longer they charge.
//Player can cancel a throw or try to block by holding the right mouse button.

if mouse_check_button_released(mb_left) and mouse_check_button(mb_right) == false{
    windup = 0
    catch = 0
    if(ch_ball == true and catch == 0 and scuffling == false and tackle == false){
        global.throw = st_throw*ch_power
        ch_ball = false
        ch_power = .5
        throw_leway = 15
        move_towards_point(mouse_x, mouse_y, 0)
        global.targetX = mouse_x
        global.targetY = mouse_y
        if(argument0 == 1){
            global.marker1x = mouse_x
            global.marker1y = mouse_y
        }else{
            global.marker2x = mouse_x
            global.marker2y = mouse_y
        }
        if st_position < 3{
            with instance_create(x, y, obj_quaffle){
                throwtype = 1
                instance_create(mouse_x, mouse_y, obj_passmarker)
            }
        }else{
            with instance_create(x, y, obj_bludger){
                throwtype = 1
            }
        }
    }
}

if mouse_check_button_released(mb_right){
    blocking = false
}

///////////////////////////////////////////////////////////////////////
//Backspace; Debug used to test playing as player2 on opposite team////
///////////////////////////////////////////////////////////////////////

//Can be used to test robustness of online AI; switches all player's x and y values and internal variables to opposite team

if(keyboard_check_pressed(vk_backspace)){
    if(argument0 == 1){
        with(obj_player_dummy){
            if(st_position == 2){
                instance_change(obj_player2_test, false)
            }
        }
        instance_change(obj_player_teammate, false)
    }else{
        with(obj_player_teammate){
            if(st_position == 2){
                instance_change(obj_player_test, false)
            }
        }
        instance_change(obj_player_dummy, false)
    }
}

if(scuffling == false and jumping == true){
    if(distance_to_point(jumpX, jumpY) < 8){
        jumping = false
        speed = 0
    }else{
        move_towards_point(jumpX, jumpY, st_power+3)
    }
}
