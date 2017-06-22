//argument0 = self
//argument1 = object type, either obj_player_teammate or obj_player_dummy

with obj_player_dummy{
    if st_position < 3 and ch_off_broom == false and tackle == false{
        if instance_nearest(global.ballX, global.ballY, obj_player_dummy).x == x and instance_nearest(global.ballX, global.ballY, obj_player_dummy).y == y{
            if argument0 == "x"{
                return x;
            }
            if argument0 == "y"{
                return y;
            }
            if argument0 = "distance"{
                return distance_to_point(global.ballX, global.ballY)
            }
        }
    }
}

/*
myX = argument0.x
myY = argument0.y

if argument1 == 1{
    with argument0{
        if instance_nearest(global.ballX, global.ballY, obj_player_teammate).x == x and instance_nearest(global.ballX, global.ballY, obj_player_teammate).y == y{
            return distance_to_point(global.ballX, global.ballY)
        }
    }
}

if argument1 == 2{
    with argument0{
        if instance_nearest(global.ballX, global.ballY, obj_player_dummy).x == x and instance_nearest(global.ballX, global.ballY, obj_player_dummy).y == y{
            return distance_to_point(global.ballX, global.ballY)
        }
    }
}

return -1*/
