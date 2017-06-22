//create either a bludger or a quaffle
//with a throwtype (e.g. what the target will be and who is throwing it)
//with a direction

//argument0 = object
//argument1 = x
//argument2 = y
//argument3 = speed == throwtype
//argument4 = direction

var inst;
inst = instance_create(argument1, argument2, argument0)
with (inst){
 speed = argument3
 throwtype = argument3
 direction = argument4   
}
