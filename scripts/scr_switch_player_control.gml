//argument0 = obj_player_test or obj_player2_test
//argument1 = obj_player_teammate or obj_player_dummy

if keyboard_check_pressed(vk_control) and global.Allai == false{

    if instance_number(argument0) > 0{ //if obj_player_test or obj_player2_test exists
          if(argument0.st_position == 3){ //if obj_player is a beater
                if (st_position == 1){
                      if (ch_ball == true){
                        with argument0{ instance_change(argument1, false) } //change obj_player_test into AI, change self into player controlled by user
                        instance_change(argument0, false)
                      //Has ball
                      }
                }else if (st_position == 2){
                      with argument0{ instance_change(argument1, false) }
                      instance_change(argument0, false)
                      //Is keeper
                      }
          }else if argument0.st_position < 3{ //if user is a beater or a keeper
            if st_position == 3 and argument0.y != y and argument0.x != x and ch_ball == true{
                if scr_beater_teammate_is_bludgerless() == true{
                        with argument0{
                            instance_change(argument1, false)
                            }
                        instance_change(argument0, false)
                        //1 bludger; bludger in pair with ball
                  }else if scr_check_closest_beater_teammate() == true{
                        with argument0{
                            instance_change(argument1, false)
                            }
                        instance_change(argument0, false)
                        //No bludgers; beater closest to bludger
                  }else if instance_nearest(obj_center_opp.x, obj_center_opp.y, argument1).x == x and instance_nearest(obj_center_opp.x, obj_center_opp.y, argument1).y == y{
                        with argument0{
                            instance_change(argument1, false)
                        }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to the ball
                  }else{
                        with argument0{
                            beaterFound = false
                        }
                }
            }

            if argument0.st_position == 3{
                argument0.beaterFound = true
            }
        
            for(i = 0; i < 7; i += 1){
                if(argument0.beaterFound = false){ //beaterFound will be set to true whenever the change is made in order than multiple players don't try to continue executing the loop after the switch is made
                    if(instance_find(argument1,i).st_position == 3){ //finds first beater in array
                        if(instance_find(argument1,i).id == id){ //change player into teammate
                            with(argument0){
                                instance_change(argument1, false)
                            }
                            instance_change(argument0, false)
                        }
                            argument0.beaterFound = true
                            break; //exit
                    }
                }
            }
        
        }
        
    }
}

/*
                        exit
                  exit
                  if instance_number(obj_bludger == 1
                        if instance_nearest(obj_bludger.x, obj_bludger.y, argument1).x == x
                        if instance_nearest(obj_bludger.x, obj_bludger.y, argument1).y == y
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to the ball
                  }else{
                        if instance_nearest(global.ballX, global.ballY, argument1).x == x
                        if instance_nearest(global.ballX, global.ballY, argument1).y == y
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to the ball
                  }else{
                        if instance_nearest(obj_snitch.x, obj_snitch.y, argument1).x == x
                        if instance_nearest(obj_snitch.x, obj_snitch.y, argument1).y == y
                        if instance_number(obj_snitch) > 0
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to snitch
                  }else{
                        if instance_nearest(room_width/2, room_height/2, argument1).x == x
                        if instance_nearest(room_width/2, room_height/2, argument1).y == y
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to center field
                  }else{
                        if instance_nearest(obj_center_hoop.x, obj_center_hoop.y, argument1).x == x
                        if instance_nearest(obj_center_hoop.x, obj_center_hoop.y, argument1).y == y
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to opposing hoops
                  }else{
                        if instance_nearest(obj_center_opp.x, obj_center_opp.y-64, argument1).x == x
                        if instance_nearest(obj_center_opp.x, obj_center_opp.y-64, argument1).y == y
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to opposing hoops
                  }else{
                        if instance_nearest(obj_center_opp.x+96, obj_center_opp.y, argument1).x == x
                        if instance_nearest(obj_center_opp.x+96, obj_center_opp.y, argument1).y == y
                        exit
                        with argument0{ instance_change(argument1, false) }
                        instance_change(argument0, false)
                        //both bludgers; beater closest to opposing hoops
}*/
