//regional finals is the 17th game!
//first game of WC brackets is 18th game!

if global.wins+global.losses > 12{
    if (global.wins+global.losses+global.bracketGamesMissed != 17){ //not the result of the final bracket game
        scr_calculateBracket() //calculate bracket positions (each win/loss + whether or not the player won and moved on)
    }else{
    
        //reset the bracket for World Cup!
        for(i = 0; i < 33; i += 1){ //32+1 because for some reason if your seed is 31, its out of bounds!?
            global.bracketList[i] = -2;
        }
        
        for(i = 0; i < 17; i += 1){
            global.sweetSixteenList[i] = -2;
        }
        
        for(i = 0; i < 9; i += 1){
            global.eliteEightList[i] = -2;
        }
        for(i = 0; i < 5; i += 1){
            global.finalFourList[i] = -2;
        }
        for(i = 0; i < 3; i += 1){
            global.topTwoList[i] = -2;
        }

        seed = global.seed;
        global.bracketList[seed] = -1; 
        
        for(i = 0; i < 32 i+= 1){
            if global.bracketList[i] != -1{
                global.bracketList[i] = irandom(138)
            }else{
                global.bracketList[31] = irandom(138)
            }
        }
    }
    scr_calculateBracket()
}else{

    scoreDiff = 4 - global.poolLosses
    //scoreDiff = global.wins - global.poolLosses + 4
    
    seed = round(33 - 8.5*(scoreDiff) + irandom(4))
    
    if seed < 0{
        seed = 0 //1 seed
    }

    if seed > 31{
        seed = 31 //32 seed
    }
    
    global.bracketList[seed] = -1; //set self into place
    global.seed = seed;
    
    for(i = 0; i < 32 i+= 1){
        if global.bracketList[i] != -1{
            global.bracketList[i] = global.regionList[i]
        }else{
            global.bracketList[31] = global.regionList[i]
        }
    }
    //fill with teams from region
    //top 16 from 4 regions go to World Cup
    
    show_message("scr_calculateSeeds; Seed calculated: " + string(seed))
    //show_message(argument0); //debug;
}
