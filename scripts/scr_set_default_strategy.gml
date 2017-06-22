//room league options creates all of the defaults.

/*if room == rm_playmaker or room == rm_playmaker_alt{
    with obj_player_position{ //clears old starters to make room for possible changes, prevents duplicates
    instance_destroy()
    }
for(i = 0; i < 7; i += 1){
    if charray[i, 11] == 1 {
            if global.chasers == 0 {
                action_create_object_motion(obj_player_position, obj_controller.charray[0, 1]*xmodifier+xintercept, obj_controller.charray[0, 2]*ymodifier, charray[i, 0], 0) //place in relative position based on where it would be on the actual pitch
                global.chasers = 1
                continue
                }
            if global.chasers == 1 {
                action_create_object_motion(obj_player_position, obj_controller.charray[1, 1]*xmodifier+xintercept, obj_controller.charray[1, 2]*ymodifier, charray[i, 0], 0)
                global.chasers = 2
                continue
                }
            if global.chasers == 2 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[2, 1]*xmodifier+xintercept, obj_controller.charray[2, 2]*ymodifier, charray[i, 0], 0)
                global.chasers = 3
                continue
                }
             
            if global.chasers == 3 {
                action_create_object_motion(obj_player_position, 32, 96, charray[i,0], 0)
                global.chasers = 4
                continue
                }
            if global.chasers == 4 {
                action_create_object_motion(obj_player_position, 96, 96, charray[i,0], 0)
                global.chasers = 5
                continue
                }
            if global.chasers == 5 {
                action_create_object_motion(obj_player_position, 160, 96, charray[i,0], 0)
                global.chasers = 6
                continue
                } 
        }
    if charray[i, 11] == 2{
        if global.keepers < 1{
            if global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[3, 1]*xmodifier+xintercept, obj_controller.charray[3, 2]*ymodifier, charray[i,0], 0)
            }
            if global.playeroption == 5{
            action_create_object_motion(obj_player_position, obj_controller.charray[2, 1]*xmodifier+xintercept, obj_controller.charray[2, 2]*ymodifier, charray[i,0], 0)
            }
            global.keepers = 1
            continue
        }else{
             
            action_create_object_motion(obj_player_position, 224, 96, charray[i,0], 0)
            global.keepers = 2 
            continue
            }
        }
    if charray[i, 11] == 3{
            if global.beaters == 0{
                if global.playeroption == 7{
                    action_create_object_motion(obj_player_position, obj_controller.charray[4, 1]*xmodifier+xintercept, obj_controller.charray[4, 2]*ymodifier, charray[i,0], 0)
                }
                if global.playeroption == 5{
                    action_create_object_motion(obj_player_position, obj_controller.charray[3, 1]*xmodifier+xintercept, obj_controller.charray[3, 2]*ymodifier, charray[i,0], 0)
                }
                global.beaters = 1
                continue
                }
            if global.beaters == 1 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[5, 1]*xmodifier+xintercept, obj_controller.charray[5, 2]*ymodifier, charray[i,0], 0)
                global.beaters = 2
                continue
                }
             if global.beaters == 2{
                action_create_object_motion(obj_player_position, 64, 128, charray[i,0], 0)
                global.beaters = 3
                continue
                }
            if global.beaters == 3{
                action_create_object_motion(obj_player_position, 128, 128, charray[i,0], 0)
                global.beaters = 4
                continue
                } 
            }
    if charray[i, 11] == 4  {
        if global.seekers < 1{
            if global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[6, 1]*xmodifier+xintercept, obj_controller.charray[6, 2]*ymodifier, charray[i,0], 0)
            }
            if global.playeroption == 5{
                action_create_object_motion(obj_player_position, obj_controller.charray[5, 1]*xmodifier+xintercept, obj_controller.charray[5, 2]*ymodifier, charray[i,0], 0)
            }
            global.seekers = 1
            continue
        }else{
             
            action_create_object_motion(obj_player_position, 192, 128, charray[i,0], 0)
            global.seekers = 2
            continue 
            }
        }
    } 
}

if room == rm_broomsup{
    for(i = 0; i < global.playeroption; i += 1){
    if charray[i, 11] == 1 {
            if global.chasers == 0 {
                action_create_object_motion(obj_player_position, obj_controller.charray[0, 12], obj_baby_opp.y-16, charray[i, 0], 0)
                global.chasers = 1
                continue
                }
            if global.chasers == 1 {
                action_create_object_motion(obj_player_position, obj_controller.charray[1, 12], obj_baby_opp.y-16, charray[i, 0], 0)
                global.chasers = 2
                continue
                }
            if global.chasers == 2 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[2, 12], obj_baby_opp.y-16, charray[i, 0], 0)
                global.chasers = 3
                continue
                }
             
            if global.chasers == 3 {
                action_create_object_motion(obj_player_position, 32, 96, charray[i,0], 0)
                global.chasers = 4
                continue
                }
            if global.chasers == 4 {
                action_create_object_motion(obj_player_position, 96, 96, charray[i,0], 0)
                global.chasers = 5
                continue
                }
            if global.chasers == 5 {
                action_create_object_motion(obj_player_position, 160, 96, charray[i,0], 0)
                global.chasers = 6
                continue
                } 
        }
    if charray[i, 11] == 2{
        if global.keepers < 1{
            if global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[3, 12], obj_baby_opp.y-16, charray[i,0], 0)
            }
            if global.playeroption == 5{
                action_create_object_motion(obj_player_position, obj_controller.charray[2, 12], obj_baby_opp.y-16, charray[i,0], 0)
            }
            global.keepers = 1
            continue
        }else{ 
            action_create_object_motion(obj_player_position, 224, 96, charray[i,0], 0)
            global.keepers = 2
            continue 
            }
        }
    if charray[i, 11] == 3{
            if global.beaters == 0{
                if global.playeroption == 7{
                    action_create_object_motion(obj_player_position, obj_controller.charray[4, 12], obj_baby_opp.y-16, charray[i,0], 0)
                    }
                if global.playeroption == 5{
                    action_create_object_motion(obj_player_position, obj_controller.charray[3, 12], obj_baby_opp.y-16, charray[i,0], 0)
                }
                global.beaters = 1
                continue
                }
            if global.beaters == 1 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[5, 12], obj_baby_opp.y-16, charray[i,0], 0)
                global.beaters = 2
                continue
                } 
            if global.beaters == 2{
                action_create_object_motion(obj_player_position, 64, 128, charray[i,0], 0)
                global.beaters = 3
                continue
                }
            if global.beaters == 3{
                action_create_object_motion(obj_player_position, 128, 128, charray[i,0], 0)
                global.beaters = 4
                continue
                } 
            }
    if charray[i, 11] == 4  {
        if global.seekers < 1{
            action_create_object_motion(obj_player_position, 32, 368, charray[i,0], 0)
            global.seekers = 1
            continue
        }else{ 
            action_create_object_motion(obj_player_position, 192, 128, charray[i,0], 0)
            global.seekers = 2
            continue 
            }
        }
    } 
}

    (obj_controller.charray[0, 12]-320)/2 =((768-(y)*(240/540))/2)-160
      obj_controller.charray[0, 12] =((768-(y)*(240/540))/2)
      obj_controller.charray[0, 12]*2*540/240 =768*540/240-(y)
      obj_controller.charray[0, 12]*2*540/240(-768*(540/240)) = -y
      y =  obj_controller.charray[0, 12]*4.5 -1728))  //SHOW YOUR WORK  ((obj_controller.charray[0, 12]*(-120/540)+768.7))/2,
      
       (obj_controller.charray[0, 12]-320)/2 =((768-(y)*(240/540))/2)-160
       ((obj_controller.charray[0, 12]-320)/2)+160 =((768-(y)*(240/540))/2)
       (((obj_controller.charray[0, 12[-320)/2)+160)*2 = (768-(y)*240/540)
        (((obj_controller.charray[0, 12[-320)/2)+160)*2-768 = -y*240/540
         ((((obj_controller.charray[0, 12[-320)/2)+160)*2-768)*540/240 = -y
         y = ((((obj_controller.charray[0, 12]-320)/2)+160)*2-768)*-2.25 
       
      
      
  
if room == rm_broomsup_alt{
    for(i = 0; i < global.playeroption; i += 1){
    if charray[i, 11] == 1 {
            if global.chasers == 0 {
                action_create_object_motion(obj_player_position, (obj_controller.charray[0, 12]-320)/2, ((((obj_controller.charray[0, 12]-320)/2)+160)*2-768)*-2.25, charray[i, 0], 0)
                global.chasers = 1
                continue
                }
            if global.chasers == 1 {
                action_create_object_motion(obj_player_position, (obj_controller.charray[1, 12]-320)/2, ((((obj_controller.charray[1, 12]-320)/2)+160)*2-768)*-2.25, charray[i, 0], 0)
                global.chasers = 2
                continue
                }
            if global.chasers == 2 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, (obj_controller.charray[2, 12]-320)/2, ((((obj_controller.charray[2, 12]-320)/2)+160)*2-768)*-2.25, charray[i, 0], 0)
                global.chasers = 3
                continue
                }
             
            if global.chasers == 3 {
                action_create_object_motion(obj_player_position, 32, 96, charray[i,0], 0)
                global.chasers = 4
                continue
                }
            if global.chasers == 4 {
                action_create_object_motion(obj_player_position, 96, 96, charray[i,0], 0)
                global.chasers = 5
                continue
                }
            if global.chasers == 5 {
                action_create_object_motion(obj_player_position, 160, 96, charray[i,0], 0)
                global.chasers = 6
                continue
                } 
        }
    if charray[i, 11] == 2{
        if global.keepers < 1{
            if global.playeroption == 7{
                action_create_object_motion(obj_player_position, (obj_controller.charray[3, 12]-320)/2, ((((obj_controller.charray[3, 12]-320)/2)+160)*2-768)*-2.25, charray[i,0], 0)
            }
            if global.playeroption == 5{
                action_create_object_motion(obj_player_position, (obj_controller.charray[2, 12]-320)/2, ((((obj_controller.charray[2, 12]-320)/2)+160)*2-768)*-2.25, charray[i,0], 0)
            }
            global.keepers = 1
            continue
        }else{ 
            action_create_object_motion(obj_player_position, 224, 96, charray[i,0], 0)
            global.keepers = 2
            continue 
            }
        }
    if charray[i, 11] == 3{
            if global.beaters == 0{
                if global.playeroption == 7{
                    action_create_object_motion(obj_player_position, (obj_controller.charray[4, 12]-320)/2, ((((obj_controller.charray[4, 12]-320)/2)+160)*2-768)*-2.25, charray[i,0], 0)
                    }
                if global.playeroption == 5{
                    action_create_object_motion(obj_player_position, (obj_controller.charray[3, 12]-320)/2, ((((obj_controller.charray[3, 12]-320)/2)+160)*2-768)*-2.25, charray[i,0], 0)
                }
                global.beaters = 1
                continue
                }
            if global.beaters == 1 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, (obj_controller.charray[5, 12]-320)/2, ((((obj_controller.charray[5, 12]-320)/2)+160)*2-768)*-2.25, charray[i,0], 0)
                global.beaters = 2
                continue
                } 
            if global.beaters == 2{
                action_create_object_motion(obj_player_position, 64, 128, charray[i,0], 0)
                global.beaters = 3
                continue
                }
            if global.beaters == 3{
                action_create_object_motion(obj_player_position, 128, 128, charray[i,0], 0)
                global.beaters = 4
                continue
                } 
            }
    if charray[i, 11] == 4  {
        if global.seekers < 1{
            action_create_object_motion(obj_player_position, 32, 368, charray[i,0], 0)
            global.seekers = 1
            continue
        }else{ 
            action_create_object_motion(obj_player_position, 192, 128, charray[i,0], 0)
            global.seekers = 2
            continue 
            }
        }
    } 
}

if room == rm_offense or room == rm_offense_alt{

    for(i = 0; i < 7; i += 1){
    if charray[i, 11] == 1 {
            if global.chasers == 0 {
                action_create_object_motion(obj_player_position, obj_controller.charray[0, 13]*xmodifier+xintercept, obj_controller.charray[0, 14]*ymodifier, charray[i, 0], 0)
                global.chasers = 1
                continue
                }
            if global.chasers == 1 {
                action_create_object_motion(obj_player_position, obj_controller.charray[1, 13]*xmodifier+xintercept, obj_controller.charray[1, 14]*ymodifier, charray[i, 0], 1)
                global.chasers = 2
                continue
                }
            if global.chasers == 2 and global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[2, 13]*xmodifier+xintercept, obj_controller.charray[2, 14]*ymodifier, charray[i, 0], 2)
                global.chasers = 3
                continue
                }
        }
    if charray[i, 11] == 2{
        if global.keepers < 1{
            if global.playeroption == 7{
                action_create_object_motion(obj_player_position, obj_controller.charray[3, 13]*xmodifier+xintercept, obj_controller.charray[3, 14]*ymodifier, charray[i,0], 3)
            }
            if global.playeroption == 5{
                action_create_object_motion(obj_player_position, obj_controller.charray[2, 13]*xmodifier+xintercept, obj_controller.charray[2, 14]*ymodifier, charray[i,0], 2)
            }
            global.keepers = 1
            continue
            }
        }
    if charray[i, 11] == 3{
            if global.beaters == 0{
                if global.playeroption == 7{
                    action_create_object_motion(obj_player_position, obj_controller.charray[4, 13]*xmodifier+xintercept, obj_controller.charray[4, 14]*ymodifier, charray[i,0], 4)
                }
                if global.playeroption == 5{
                    action_create_object_motion(obj_player_position, obj_controller.charray[3, 13]*xmodifier+xintercept, obj_controller.charray[3, 14]*ymodifier, charray[i,0], 3)
                }
                global.beaters = 1
                continue
                }
            if global.beaters == 1 and global.playeroption == 7{
                    action_create_object_motion(obj_player_position, obj_controller.charray[5, 13]*xmodifier+xintercept, obj_controller.charray[5, 14]*ymodifier, charray[i,0], 5)
                global.beaters = 2
                continue
                }
            }
    } 
}*/

//This was in scr_set_charray
//each obj_player_position sets themself in charray based on their starting position

//find first 5 or 7 players in each position based on ARRAY CREATED IN CHOOSE PLAYERS
//find first 5 or 7 players in each position based on ARRAY CREATED IN CHOOSE PLAYERS
//find first 5 or 7 players in each position based on ARRAY CREATED IN CHOOSE PLAYERS

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

//rm_playmaker_alt

if global.playeroption == 7{
    for(o = 0; o < 7 and filled == false; o += 1){
    if st_position == 4{
        obj_controller.charray[6, 0] = self_id
        obj_controller.charray[6, 1] = tetherX1*2+320
        obj_controller.charray[6, 2] = tetherY1*2
        obj_controller.charray[6, 3] = tetherX2
        obj_controller.charray[6, 4] = tetherY2
        obj_controller.charray[6, 5] = strategy
        obj_controller.charray[6, 6] = manStrategy
        obj_controller.charray[6, 7] = zone
        obj_controller.charray[6, 8] = zonesize
        obj_controller.charray[6, 9] = seeker_catch
        obj_controller.charray[6, 10] = seeker_defend
        obj_controller.charray[6, 11] = st_position
        filled = true
        exit
    }
    if obj_controller.charray[o, 0] == -1 and filled == false{
        obj_controller.charray[o, 0] = self_id
        obj_controller.charray[o, 1] = tetherX1*2+320
        obj_controller.charray[o, 2] = tetherY1*2
        obj_controller.charray[o, 3] = tetherX2
        obj_controller.charray[o, 4] = tetherY2
        obj_controller.charray[o, 5] = strategy
        obj_controller.charray[o, 6] = manStrategy
        obj_controller.charray[o, 7] = zone
        obj_controller.charray[o, 8] = zonesize
        obj_controller.charray[o, 9] = seeker_catch
        obj_controller.charray[o, 10] = seeker_defend
        obj_controller.charray[o, 11] = st_position
        filled = true
        }    
    }
}

if global.playeroption == 5{
    for(o = 0; o < 5 and filled == false; o += 1){
    if st_position == 4{
        obj_controller.charray[4, 0] = self_id
        obj_controller.charray[4, 1] = tetherX1*2+320
        obj_controller.charray[4, 2] = tetherY1*2
        obj_controller.charray[4, 3] = tetherX2
        obj_controller.charray[4, 4] = tetherY2
        obj_controller.charray[4, 5] = strategy
        obj_controller.charray[4, 6] = manStrategy
        obj_controller.charray[4, 7] = zone
        obj_controller.charray[4, 8] = zonesize
        obj_controller.charray[4, 9] = seeker_catch
        obj_controller.charray[4, 10] = seeker_defend
        obj_controller.charray[4, 11] = st_position
        filled = true
        exit
    }
    if obj_controller.charray[o, 0] == -1 and filled == false and st_position != 4{
        obj_controller.charray[o, 0] = self_id
        obj_controller.charray[o, 1] = tetherX1*2+320
        obj_controller.charray[o, 2] = tetherY1*2
        obj_controller.charray[o, 3] = tetherX2
        obj_controller.charray[o, 4] = tetherY2
        obj_controller.charray[o, 5] = strategy
        obj_controller.charray[o, 6] = manStrategy
        obj_controller.charray[o, 7] = zone
        obj_controller.charray[o, 8] = zonesize
        obj_controller.charray[o, 9] = seeker_catch
        obj_controller.charray[o, 10] = seeker_defend
        obj_controller.charray[o, 11] = st_position
        filled = true
        }    
    }
}


//rm broomsup_alt

findID = 0

if global.playeroption == 7{

for(i = 0; i < 7; i += 1){//was 14
        if obj_controller.charray[i, 0] == self_id
        {
        findID = i
        }
}
    
    //if distance_to_object(obj_bench_slot) > 1 and y > room_height/2{
        obj_controller.charray[findID, 12] = x*2+320
        if st_position < 3{
            if instance_nearest(168, 256, obj_player_position).x == x{
                obj_controller.charray[findID, 15] = 1 //go for quaffle
            }else{
                obj_controller.charray[findID, 15] = 2 //up
                if st_position == 2{
                obj_controller.charray[findID, 15] = 0 //stay back
                }
            }
        }
        
        //}
}

if global.playeroption == 5{
for(i = 0; i < 5; i += 1){//was 14
        if obj_controller.charray[i, 0] == self_id
        {
        findID = i
        }
}
    
    //if distance_to_object(obj_bench_slot) > 1 and y > room_height/2{
        obj_controller.charray[findID, 12] = x*2+320
        if st_position < 3{
            if instance_nearest(176, 216, obj_player_position).x == x{
                obj_controller.charray[findID, 15] = 1
            }else{
                obj_controller.charray[findID, 15] = 2
                if st_position == 2{
                obj_controller.charray[findID, 15] = 0
                }
            }
        }
        
        //}
}

//room_offense_alt

findID = 0

if global.playeroption == 7{
    
    for(i = 0; i < 7; i += 1){
        if obj_controller.charray[i, 0] == self_id
        {
        findID = i
        //show_message(string(self_id) + " Found");
        }
    }
    //if distance_to_object(obj_bench_slot) > 1{
            obj_controller.charray[findID, 13] = x*2+320
            obj_controller.charray[findID, 14] = y*2
            obj_controller.charray[findID, 17] = po_withball
            obj_controller.charray[findID, 18] = po_noball
            
      //  }
}

if global.playeroption == 5{
    for(i = 0; i < 5; i += 1){
        if obj_controller.charray[i, 0] == self_id
        {
        findID = i
        //show_message(string(self_id) + " Found");
        }
    }
    //if distance_to_object(obj_bench_slot) > 1{
            obj_controller.charray[findID, 13] = x*2+320
            obj_controller.charray[findID, 14] = y*2
            obj_controller.charray[findID, 17] = po_withball
            obj_controller.charray[findID, 18] = po_noball
            
        //}
}
