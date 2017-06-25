//Sets player into array based on location on starter tab. Starters appear in next tab

//sets into array [chaser, chaser, chaser, keeper, beater, beater, seeker]
if global.playeroption == 7{

    for(i = 0; i < 7; i += 1){
        if x == global.starterx+64*i and y == global.startery{
            obj_controller.charray[i, 0] = self_id
            obj_controller.charray[i, 11] = st_position
        }
    }
    
    for(i = 0; i < 7; i += 1){
        if x == global.starterx+64*i and y == global.startery+64{
            obj_controller.charray[i+7, 0] = self_id
            obj_controller.charray[i+7, 11] = st_position
        }
    }
}


//sets into array [chaser, chaser, keeper, beater, seeker]

if global.playeroption == 5{
    for(i = 0; i < 5; i += 1){
        if x == global.starterx+64*i and y == global.startery{
            obj_controller.charray[i, 0] = self_id
            obj_controller.charray[i, 11] = st_position
        }
    }
    
    for(i = 0; i < 5; i += 1){
        if x == global.starterx+64*i and y == global.startery+64{
            obj_controller.charray[i+5, 0] = self_id
            obj_controller.charray[i+5, 11] = st_position
        }
    }
}
