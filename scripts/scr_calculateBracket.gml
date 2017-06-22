seed = global.seed //player's seed
//regional finals is the 17th game!
//NOT the 16th game

if (global.wins+global.losses+global.bracketGamesMissed == 13) or (global.wins+global.losses+global.bracketGamesMissed == 18){
    //show_message("== works (scr_calculateBracket)");
    for(i = 0; i < 16; i += 1){ //13 wins + losses ONE SEED IS ZERO IN ARRAY; KEEP IT THAT WAY
    global.sweetSixteenList[i] = choose(global.bracketList[i], global.bracketList[31-i]);
    //1 plays 32 <--- 1 slot, will play 16 slot [0] slot = [0] plays [31]
    //2 plays 31 <--- 2 slot, will play 15 slot
    //3 plays 30 <--- 3 slot, will play 14 slot
    //4 plays 29 <--- 4 slot, will play 13 slot
    //5 plays 28 <--- 5 slot, will play 12 slot
    //6 plays 27 <--- 6 slot, will play 11 slot
    //7 plays 26 <--- 7 slot, will play 10 slot
    //8 plays 25 <--- 8 slot, will play 9 slot
    //9 plays 24 <--- 9 slot, will play 8 slot
    //10 plays 23 <-- 10 slot, will play 7 slot
    //11 plays 22 <-- 11 slot, will play 6 slot
    //12 plays 21 <-- 12 slot, will play 5 slot
    //13 plays 20 <-- 13 slot, will play 4 slot
    //14 plays 19 <-- 14 slot, will play 3 slot
    //15 plays 18 <-- 15 slot, will play 2 slot
    //16 plays 17 <-- 16 slot, will play 1 slot [15] slot = [15] plays [16]
    }
    
    //if score is higher than opponent score, set 16 bracket to -1 of player's seed
    if (global.team1_score > global.team2_score){
        if(seed < 16){
            global.sweetSixteenList[seed] = -1;
        }else{
            global.sweetSixteenList[31-seed] = -1;
            global.seed = 31-seed //if 20, seed changes to 11
                                //if 16, seed changes to 15
        }
    }
    
    }

if (global.wins+global.losses+global.bracketGamesMissed == 14)  or (global.wins+global.losses+global.bracketGamesMissed == 19){
    for(i = 0; i < 8; i += 1){ //13 wins + losses ONE SEED IS ZERO IN ARRAY; KEEP IT THAT WAY
    global.eliteEightList[i] = choose(global.sweetSixteenList[i], global.sweetSixteenList[15-i]);
    //1 plays 32 <--- 1 slot, will play 16 slot [0] slot = [0] plays [31]
    //2 plays 31 <--- 2 slot, will play 15 slot
    //3 plays 30 <--- 3 slot, will play 14 slot
    //4 plays 29 <--- 4 slot, will play 13 slot
    //5 plays 28 <--- 5 slot, will play 12 slot
    //6 plays 27 <--- 6 slot, will play 11 slot
    //7 plays 26 <--- 7 slot, will play 10 slot
    //8 plays 25 <--- 8 slot, will play 9 slot
    //9 plays 24 <--- 9 slot, will play 8 slot
    //10 plays 23 <-- 10 slot, will play 7 slot
    //11 plays 22 <-- 11 slot, will play 6 slot
    //12 plays 21 <-- 12 slot, will play 5 slot
    //13 plays 20 <-- 13 slot, will play 4 slot
    //14 plays 19 <-- 14 slot, will play 3 slot
    //15 plays 18 <-- 15 slot, will play 2 slot
    //16 plays 17 <-- 16 slot, will play 1 slot [15] slot = [15] plays [16]
    }
    
    //if score is higher than opponent score, set 16 bracket to -1 of player's seed
    if (global.team1_score > global.team2_score){
        if(seed < 8){
            global.eliteEightList[seed] = -1;
        }else{
            global.eliteEightList[15-seed] = -1;
            global.seed = 15-seed //if 11, seed changes to 4
                                //if 15, seed changes to 0
        }
    }

}

if (global.wins+global.losses+global.bracketGamesMissed == 15)  or (global.wins+global.losses+global.bracketGamesMissed == 20){
    for(i = 0; i < 4; i += 1){ //13 wins + losses ONE SEED IS ZERO IN ARRAY; KEEP IT THAT WAY
    global.finalFourList[i] = choose(global.eliteEightList[i], global.eliteEightList[7-i]);
    //1 plays 32 <--- 1 slot, will play 16 slot [0] slot = [0] plays [31]
    //2 plays 31 <--- 2 slot, will play 15 slot
    //3 plays 30 <--- 3 slot, will play 14 slot
    //4 plays 29 <--- 4 slot, will play 13 slot
    //5 plays 28 <--- 5 slot, will play 12 slot
    //6 plays 27 <--- 6 slot, will play 11 slot
    //7 plays 26 <--- 7 slot, will play 10 slot
    //8 plays 25 <--- 8 slot, will play 9 slot
    //9 plays 24 <--- 9 slot, will play 8 slot
    //10 plays 23 <-- 10 slot, will play 7 slot
    //11 plays 22 <-- 11 slot, will play 6 slot
    //12 plays 21 <-- 12 slot, will play 5 slot
    //13 plays 20 <-- 13 slot, will play 4 slot
    //14 plays 19 <-- 14 slot, will play 3 slot
    //15 plays 18 <-- 15 slot, will play 2 slot
    //16 plays 17 <-- 16 slot, will play 1 slot [15] slot = [15] plays [16]
    }
    
    //if score is higher than opponent score, set 16 bracket to -1 of player's seed
    if (global.team1_score > global.team2_score){
        if(seed < 4){
            global.finalFourList[seed] = -1; //if seed = 4, stays at 4
                                            //if seed = 0, stays at 0
        }else{
            global.finalFourList[7-seed] = -1;
            global.seed = 7-seed
        }
    }

}

if (global.wins+global.losses+global.bracketGamesMissed == 16) or (global.wins+global.losses+global.bracketGamesMissed == 21){
    for(i = 0; i < 2; i += 1){ //13 wins + losses ONE SEED IS ZERO IN ARRAY; KEEP IT THAT WAY
    global.topTwoList[i] = choose(global.finalFourList[i], global.finalFourList[3-i]);
    //1 plays 32 <--- 1 slot, will play 16 slot [0] slot = [0] plays [31]
    //2 plays 31 <--- 2 slot, will play 15 slot
    //3 plays 30 <--- 3 slot, will play 14 slot
    //4 plays 29 <--- 4 slot, will play 13 slot
    //5 plays 28 <--- 5 slot, will play 12 slot
    //6 plays 27 <--- 6 slot, will play 11 slot
    //7 plays 26 <--- 7 slot, will play 10 slot
    //8 plays 25 <--- 8 slot, will play 9 slot
    //9 plays 24 <--- 9 slot, will play 8 slot
    //10 plays 23 <-- 10 slot, will play 7 slot
    //11 plays 22 <-- 11 slot, will play 6 slot
    //12 plays 21 <-- 12 slot, will play 5 slot
    //13 plays 20 <-- 13 slot, will play 4 slot
    //14 plays 19 <-- 14 slot, will play 3 slot
    //15 plays 18 <-- 15 slot, will play 2 slot
    //16 plays 17 <-- 16 slot, will play 1 slot [15] slot = [15] plays [16]
    }
    
    //if score is higher than opponent score, set 16 bracket to -1 of player's seed
    if (global.team1_score > global.team2_score){
        if(seed < 2){
            global.topTwoList[seed] = -1;
        }else{
            global.topTwoList[3-seed] = -1;
            global.seed = 3-seed //seed = 4, seed is -1
        }
    }

}

/*for(i = 0; i < 8; i += 1){
global.eliteEightList[i] = 0;
}
for(i = 0; i < 4; i += 1){
global.finalFourList[i] = 0;
}
for(i = 0; i < 2; i += 1){
global.topTwoList[i] = 0;
}*/
