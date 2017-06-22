//FOR TEAMMATE
var noPlayersInPath = true
i = 0
if st_position < 3 and ch_ball == false and tackle == false and ch_off_broom == false{
    if distance_to_point(global.ballX, global.ballY) > 48 and distance_to_point(global.ballX, global.ballY) < 256{ //if far enough away
        for(i = 0; i < sqrt(power((x-global.ballX), 2)+ power((y-global.ballY),2)); i += 1){
            //if there is an opposing player in the way, don't pass!
            if(position_meeting(x+(i*(cos(degtorad(point_direction(x, y, global.ballX, global.ballY))))), y+(i*(sin(degtorad(point_direction(x, y, global.ballX, global.ballY))))), obj_player_dummy)) == true{
                noPlayersInPath = false;
                break;
            }
        }
        //THE ABOVE CODE HAS NO PURPOSE AT THE MOMENT
        //COS(angle) IS IN RADIAN, NOT DEGREES
        if distance_to_object(instance_nearest(x, y, obj_player_teammate)) > 16 and irandom_range(1, 2) == 1{ //if open
            global.targetX = x
            global.targetY = y
            global.marker1x = x
            global.marker1y = y
            global.targetSpeed = speed
            global.targetDirection = direction
            return true
        }else{ //if not open
            //if covered but far
            if abs(instance_nearest(x, y, obj_player_teammate).x - global.ballX) + abs(instance_nearest(x, y, obj_player_teammate).y - global.ballY) > abs(x - global.ballX) + abs(y - global.ballY){ //if covered but far
                global.targetX = x
                global.targetY = y
                global.marker1x = x
                global.marker1y = y
                global.targetSpeed = speed
                global.targetDirection = direction
                return true
            }else{
                return false
            }
        }
    }
}else{
    return false;
}
