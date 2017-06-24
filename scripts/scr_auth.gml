var name = argument0;
var data = argument1;



if (data[? 'msgid'] == 2)
{
roomid = data[? 'roomid'];
isowner = data[? 'isowner'];
}


ds_map_destroy(data);
