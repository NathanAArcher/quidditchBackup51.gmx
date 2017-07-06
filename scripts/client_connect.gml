#define client_connect
///client_connect(ip, port)

var
ip = argument0,
port = argument1;

socket = network_create_socket(network_socket_tcp); //network socket tcp creates a socket using tcp
var connect = network_connect_raw(socket, ip, port); //if it returns < 0 we don't have a connection

send_buffer = buffer_create(256, buffer_fixed, 1);

clientmap = ds_map_create();

if(connect < 0){
    //show_error("Could not connect to Server!", true);
    scr_show_notification("Could not connect to Server! Socket: " + string(socket) + ", IP: " + string(ip) + ", Port: " + string(port));
}else{
    scr_show_notification("Connected to: " + string(connect))
}


#define client_disconnect
///client_disconnect()

ds_map_destroy(clientmap);
network_destroy(socket);


#define client_handle_message
///client_handle_message(buffer)

var buffer = argument0 //argument0 will be async_load[? "buffer"]

//case 0 will be movement
//case 1 will be shooting
//etc.

while(true){
    if(buffer_get_size(buffer) == 0){
        break;
    }else{
        //show_message("Buffer size: " + string(buffer_get_size(buffer)) +"; " + string(buffer))
    }

    var message_id = buffer_read(buffer, buffer_u8); //using buffer u8 for unsigned 8 bit integer
    
    switch(message_id)
    {
        case MESSAGE_MOVE:
        
        //read what the server sent to us
        //they need to be ready in the same order they were written, just like a file
        
        var
        client = buffer_read(buffer, buffer_u16);
        xx = buffer_read(buffer, buffer_u16);
        yy = buffer_read(buffer, buffer_u16);
        
        //if we've received message from this client before
        if(ds_map_exists(clientmap, string(client))){ //if object receiving data is already present in data structure
            var clientObject = clientmap[? string(client)];
            clientObject.x = xx;
            clientObject.y = yy;
        }else{
            var l = instance_create(xx, yy, obj_other_client); //if object not present, add to it.
            clientmap[? string(client)] = l;
            //maybe put obj_player_clients here?
        }
        
        with(obj_serverClient){
            if(client_id != client_id_current){
                network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
                //changed to self. ... at part 2 at 14:45
            }
        }
        
            
        break;
        
        case PLAYER_INPUT:
        
        /*if(buffer_get_size(buffer) == 0){
            break;
        }
        
        //read inputs from player2
        if(global.host == 1) and (string(object_get_name(object_index)) == "obj_player2_test"){
            var
            client = buffer_read(buffer, buffer_u16);
            ww = buffer_read(buffer, buffer_u16);
            aa = buffer_read(buffer, buffer_u16);
            //for(i = 0; i < 12; i+= 1){ //should be i < 12
            //    obj_controller.online_client_movement[i] = buffer_read(buffer, buffer_s16);
            //}
            if(ds_map_exists(clientmap, string(client)+"player2_input")){
                var objController = clientmap[? string(client)+"player2_input"];
                objController.online_client_movement[0] = ww;
                objController.online_client_movement[1] = aa;
                //obj_controller.online_client_movement[2] = buffer_read(buffer, buffer_s16);
                //obj_controller.online_client_movement[3] = buffer_read(buffer, buffer_s16);
            }else{
                var l = obj_controller;
                clientmap[? string(client)+"player2_input"] = l;
                action_create_object_motion(obj_player2_test, obj_baby_hoop.x-32, obj_baby_hoop.y-16, obj_controller.charray[0, 0], 0);
                //clientmap[? string(client)] = l;
            }
            
            with(obj_serverClient){
                if(client_id != client_id_current){
                    network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
                    //changed to self. ... at part 2 at 14:45
                }
            }
        }*/
        break;
        
        /*case MESSAGE_PLAYER_DATA:
        
        //read what the server sent to us
        //they need to be ready in the same order they were written, just like a file
        
        var
        client = buffer_read(buffer, buffer_u16);
        msg_st_position = buffer_read(buffer, buffer_u16);
        msg_self_id = buffer_read(buffer, buffer_u16);
        
        //if we've received message from this client before
        if(ds_map_exists(clientmap, string(client))){
            var clientObject = clientmap[? string(client)];
            clientObject.st_position = msg_st_position;
            clientObject.self_id = msg_self_id;
        }else{
            //nothin
        }
        
        with(obj_serverClient){
            if(client_id != client_id_current){
                network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
                //changed to self. ... at part 2 at 14:45
            }
        }
        
            
        break;*/
    }
    
    if(buffer_tell(buffer) == buffer_get_size(buffer)){ //if > 256 bytes; overflow
        //gets size of given buffer
        break;
    }
}


#define client_send_movement
///client_send_movement();

//if(instance_exists(obj_player)){

    buffer_seek(send_buffer, buffer_seek_start, 0);
    
    buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE); //MESSAGE_MOVE == 1
    if global.host == 0 and (instance_exists(obj_player2_test)){
        buffer_write(send_buffer, buffer_u16, round(obj_player2_test.x));
        buffer_write(send_buffer, buffer_u16, round(obj_player2_test.y));
    }else if(global.host == 1 and instance_exists(obj_player_test)){
        buffer_write(send_buffer, buffer_u16, round(obj_player_test.x));
        buffer_write(send_buffer, buffer_u16, round(obj_player_test.y));
    }
/*    buffer_seek(send_buffer, buffer_seek_start, 0);
    
    buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE); //MESSAGE_MOVE == 1
    buffer_write(send_buffer, buffer_u16, round(obj_player.x));
    buffer_write(send_buffer, buffer_u16, round(obj_player.y));
    
    //network_send_raw(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
    network_send_raw(socket, other.send_buffer, buffer_tell(send_buffer));*/
    
    //network_send_raw(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
    network_send_raw(socket, other.send_buffer, buffer_tell(send_buffer));
    
//}

#define client_send_player_data
///client_send_player_data();

//if(instance_exists(obj_player)){

    buffer_seek(send_buffer, buffer_seek_start, 0);
    
    buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE); //MESSAGE_MOVE == 1
    if(instance_exists(obj_player2_test)){
        buffer_write(send_buffer, buffer_u16, round(obj_player2_test.st_position));
        buffer_write(send_buffer, buffer_u16, round(obj_player2_test.self_id));
    }else if(instance_exists(obj_player_test)){
        buffer_write(send_buffer, buffer_u16, round(obj_player_test.st_position));
        buffer_write(send_buffer, buffer_u16, round(obj_player_test.self_id));
    }
    
    //network_send_raw(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
    network_send_raw(socket, other.send_buffer, buffer_tell(send_buffer));
    
//}
#define client_send_player2_input
///client_send_player2_input()
    
    buffer_seek(send_buffer, buffer_seek_start, 0);
    
    buffer_write(send_buffer, buffer_u8, PLAYER_INPUT); //PLAYER_INPUT == 2
    //obj_controller.online_client_movement_array[W, A, S, D, LMB, RMB, SPACE, CTRL, mouse_x, mouse_y)
    //if(instance_exists(obj_player2_test)){
    if(global.host != 1){
        /*for(i = 0; i < 12; i+= 1){
            buffer_write(send_buffer, buffer_s16, obj_controller.online_client_movement_array[i]);
            //buffer_write(send_buffer, buffer_s16, round(obj_player2_test.y));
        }*/
        var ww = obj_controller.online_client_movement_array[0];
        var aa = obj_controller.online_client_movement_array[1];
        var ss = obj_controller.online_client_movement_array[2];
        var dd = obj_controller.online_client_movement_array[3];
        /*buffer_write(send_buffer, buffer_s16, obj_controller.online_client_movement_array[0]);
        buffer_write(send_buffer, buffer_s16, obj_controller.online_client_movement_array[1]);
        buffer_write(send_buffer, buffer_s16, obj_controller.online_client_movement_array[2]);
        buffer_write(send_buffer, buffer_s16, obj_controller.online_client_movement_array[3]);*/
        buffer_write(send_buffer, buffer_u16, ww);
        buffer_write(send_buffer, buffer_u16, aa);
        //buffer_write(send_buffer, buffer_s16, ss);
        //buffer_write(send_buffer, buffer_s16, dd);
    }
    
    //network_send_raw(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
    network_send_raw(socket, other.send_buffer, buffer_tell(send_buffer));
