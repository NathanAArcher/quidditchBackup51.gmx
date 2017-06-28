//find "man" for man to man

if room == rm_test or rm_alt{
    manX = x
    manY = y
    exit
}

for(i = 0; i < 4; i += 1){
    if instance_find(obj_player_teammate, i) == self.id{
        man = instance_find(obj_player_dummy, i)
        manX = man.x
        manY = man.y
    }
}
