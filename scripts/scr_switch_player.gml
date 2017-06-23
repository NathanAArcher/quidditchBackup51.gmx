//script allows player to switch positions
//if argument0 == 1, team 1 (playerObject and teammateObject)
//if argument1 == 2, team 2 (obj_player2_test and obj_player_dummy)
    playerObject = self
    teammateObject = self
    with(obj_player_test){
        playerObject = obj_player_test
        teammateObject =  obj_player_teammate
    }
    with(obj_player2_test){
        playerObject = obj_player2_test
        teammateObject = obj_player_dummy
    }

//if(argument0 == 1){
    playerObject = obj_player_test //set default values
    teammateObject = obj_player_teammate
//}
if(argument0 == 2){
    playerObject = obj_player2_test
    teammateObject = obj_player_dummy
}

//Key Press Event for <Space> Key

if(instance_exists(playerObject) == false or instance_exists(teammateObject) == false){
    //exit //failsafe
    //shouldn't EXIT, because that would conflict with other scripts!
}else{

if keyboard_check_pressed(vk_space) and global.Allai == false and ch_off_broom == false and tackle == false{

    if (instance_exists(playerObject)){
        if playerObject.y != y and playerObject.x != x{
          if playerObject.st_position < 3{
            if st_position < 3{
                if(global.possession == argument0){
                    if(ch_ball == true){
                        with playerObject{
                            instance_change(teammateObject, false)
                        }
                        instance_change(playerObject, false)                    
                    }
                }
                    //switch to player being passed to
                if instance_exists(obj_passmarker){
                    if instance_nearest(obj_passmarker.x, obj_passmarker.y, teammateObject).x == x and instance_nearest(obj_passmarker.x, obj_passmarker.y, teammateObject).y == y{
                        with playerObject{
                            instance_change(teammateObject, false)
                        }
                        instance_change(playerObject, false)
                    }
                }
                    //switch to player nearest to the ball
                if instance_nearest(global.ballX, global.ballY, teammateObject).x == x and instance_nearest(global.ballX, global.ballY, teammateObject).y == y{
                          with playerObject{
                            instance_change(teammateObject, false) //ERROR here?
                          }
                          instance_change(playerObject, false)
                      }
                    //switch to player nearest to hoops
                else if playerObject.ch_off_broom == true and instance_nearest(obj_center_opp.x, obj_center_opp.y, teammateObject).x == x and instance_nearest(obj_center_opp.x, obj_center_opp.y, teammateObject).y == y{
                          with playerObject{
                            instance_change(teammateObject, false)
                          }
                          instance_change(playerObject, false)
                    }
                    //switch to keeper
                else if st_position == 2{
                        with playerObject{
                            instance_change(teammateObject, false)
                        }
                        instance_change(playerObject, false)
                      }
                    //switch to player nearest to me
                else if instance_nearest(playerObject.x, playerObject.y, teammateObject) == self{
                      with playerObject{
                        instance_change(teammateObject, false)
                      }
                      instance_change(playerObject, false)
                  }
                  //switch to player nearest to center of room
                else if instance_nearest(room_width/2, room_height/2, teammateObject) == self{
                    with playerObject{
                        instance_change(teammateObject, false)
                    }
                    instance_change(playerObject, false)
                    }
                }
            }
        }
    /*with teammateObject{ //I DONT KNOW WHAT THIS DID
        if playerObject.x != x or playerObject.y != y{ //if teammateObject is not player
            if ch_off_broom == false and st_position < 3{ //if not off-broom and is a QC
                with playerObject{
                    instance_change(teammateObject, false)
                }
                instance_change(playerObject, false)
                exit
            }
        }
    }*/
      if playerObject.st_position == 3{
            if st_position == 3{
                if playerObject.y != y and playerObject.x != x{
                      with playerObject{
                        instance_change(teammateObject, false)
                      }
                      instance_change(playerObject, false)
                }                 
            }
        }
    }
}

}
