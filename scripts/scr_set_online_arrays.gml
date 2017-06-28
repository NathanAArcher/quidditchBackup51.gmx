//Sets player into array based on location on starter tab. Starters appear in next tab

//sets into array [chaser, chaser, chaser, keeper, beater, beater, seeker]

    for(i = 0; i < global.playeroption*2; i += 1){
        for(j = 0; j < 17; j += 1){
            obj_controller.online_player_array[i, j] = -1
        }
    }
    
    //retrieved from scr_client_send_inputs
    
    for(i = 0; i < 12; i += 1){
        obj_controller.online_client_movement_array[i] = -1
    }
    
    for(i = 0; i < 5; i += 1){
        for(j = 0; j < 5; j += 1){
            obj_controller.online_ball_array[i, j] = -1
        }
    }
