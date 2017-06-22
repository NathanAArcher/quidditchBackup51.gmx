randomize()

global.scheduleList[0] = 0
global.poolPlay[0] = 0
global.bracketPlay[0] = 0
global.worldPoolPlay[0] = 0
global.worldBracketPlay[0] = 0
global.regionList[0] = 0;
global.sweetSixteenList[0] = 0
global.eliteEightList[0] = 0
global.finalFourList[0] = 0
global.topTwoList[0] = 0
global.seed = -1;
global.winLossList[0] = 0

randNum = 0;
j = 0;

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

for(i = 0; i < 22; i += 1){
global.winLossList[i] = -1;
}

for(i = 0; i < 32; i += 1){ //formulates 31 teams in player's "region"
    randNum = irandom(138)
    j = 0;
    while(j < i){
        if global.regionList[j] == randNum{
        randNum = irandom(138)
        j = 0;
        }
        j += 1;
    }
    global.regionList[i] = randNum;
}

for(i = 0; i < 8; i += 1){ //formulates first 8 in-region games
    global.scheduleList[i] = global.regionList[irandom_range(0, 30)]
}

for(i = 0; i < 4; i += 1){ //formulates pool play for regionals
    randNum = irandom_range(0, 30) //grabs random number within range
    j = 0
    while(j < i){ //checks to see if number already in list
        if (global.poolPlay[j] == randNum){ //if so, reset number, check again
        randNum = irandom_range(0, 30) //reset number
        j = 0; //check again
        }
        j+= 1;
    }
    //after it is confirmed the number is not in the list, add to the pool
    global.poolPlay[i] = randNum
}

for(i = 0; i < 4; i += 1){
    global.worldPoolPlay[i] = irandom(138);
    global.worldBracketPlay[i] = irandom(138);
}
