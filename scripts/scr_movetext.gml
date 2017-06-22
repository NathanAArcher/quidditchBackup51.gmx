if(string_length(ThirdLine) > count && destroyNext = false)
{
    count = string_length(ThirdLine)
    if(string_char_at(ThirdLine, count) != ','){
        //exit
    }
    exit
}

if(destroyNext = true)
    {
    scriptCount += 1;
    count = 0;
    messageCount = -1;
    destroyNext = false;
    }else{

FirstLine = SecondLine;
SecondLine = ThirdLine;
ThirdLine = LoadedLine;
}

if(messageCount = 0)
    {
    ThirdLine = argument0;
        if(argument1 = "")
        {
        destroyNext = true;
        }else{
        LoadedLine = argument1;
        }
    }
if(messageCount = 1)
    {
    if(argument2 = "")
        {
        destroyNext = true;
        }else{
        LoadedLine = argument2;
        }
    }

if(messageCount = 2)
{
    if(argument3 = "")
    {
    destroyNext = true;
    }else{
    LoadedLine = argument3;
        }
}

if(messageCount = 3)
{
    if(argument4 = "")
    {
    destroyNext = true;
    }else{
    LoadedLine = argument4;
        }
}

if(messageCount = 4)
{
destroyNext = true;
}

if scriptCount == 0 and SecondLine == ""{
    sound_play(snd_messageopen)
}else{
    sound_play(snd_messagenext)
}

messageCount += 1;
count = 0;
