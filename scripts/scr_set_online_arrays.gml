//Sets player into array based on location on starter tab. Starters appear in next tab

//sets into array [chaser, chaser, chaser, keeper, beater, beater, seeker]


    //holds variables for all AI players and player 1 to send to client.
    for(i = 0; i < global.playeroption*2; i += 1){
        for(j = 0; j < 17; j += 1){
            obj_controller.online_player_array[i, j] = -1
        }
    }
    
    //retrieved from scr_client_send_inputs
    //will set all inputs for player2/client
    
    for(i = 0; i < 12; i += 1){
        obj_controller.online_client_movement_array[i] = -1
    }
    
    //will hold data for all balls in play
    //as soon as a ball is created it is added to the array
    //as soon as it is destroyed it is removed
    for(i = 0; i < 5; i += 1){
        for(j = 0; j < 5; j += 1){
            obj_controller.online_ball_array[i, j] = -1
        }
    }
