//FOR DUMMY
if st_position < 3 and ch_ball == false and tackle == false and ch_off_broom == false{
    if distance_to_point(global.ballX, global.ballY) > 48 and distance_to_point(global.ballX, global.ballY) < 320{ //if far enough away
        if distance_to_object(instance_nearest(x, y, obj_player_dummy)) > 16 and irandom_range(1, 2) == 1{ //if open
            global.targetX = x
            global.targetY = y
            global.marker2x = x
            global.marker2y = y
            global.targetSpeed = speed
            global.targetDirection = direction
            return true
        }else{ //if covered
            //if covered but far
            if abs(instance_nearest(x, y, obj_player_dummy).x - global.ballX) + abs(instance_nearest(x, y, obj_player_dummy).y - global.ballY) > abs(x - global.ballX) + abs(y - global.ballY){ //if covered but far
                global.targetX = x
                global.targetY = y
                global.marker2x = x
                global.marker2y = y
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
