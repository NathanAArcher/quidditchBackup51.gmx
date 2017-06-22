//custom bounce script

my_direction = direction
newDirection = direction + 180
if(speed > 1){
newX = -1*speed*(cos(degtorad(direction)))
newY = speed*(sin(degtorad(direction)))
}else{
newX = -2*(cos(degtorad(direction)))
newY = 2*(sin(degtorad(direction)))
}

//if heading 180 degrees (true left) into hoops, it will jump 2 pixels to the right and start traveling right
//cos(180)*-2 = 2

//if heading 90 degrees (true up) into hoops, it will jump 2 pixels down and start traveling downward
//sin(90)*2 =  -2
//GM has an inverted axis, +2 y moves it down


//direction = newDirection
if(global.threedmode == false){
    vspeed = -1*vspeed
}else{
    if(hspeed > 0) and other.x > x and abs(y-other.y) <= 10{ //don't bounce precisely
        //WORKS PERFECTLY
        vspeed = -1*vspeed
        x = x-newX
        y = y+newY
    }
    else if(hspeed <= 0) and other.x <= x and abs (y-other.y) <= 10{ //don't bounce precisely
        //DOESN'T WORK
        vspeed = -1*speed
        x = x+newX
        y = y+newY
    }else{ //bounce precisely
        hspeed = -1*hspeed
        vspeed = -1*vspeed
        x = x+newX
        y = y+newY
    }
}
