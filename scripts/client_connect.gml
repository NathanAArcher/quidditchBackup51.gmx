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

var buffer = argument0

//case 0 will be movement
//case 1 will be shooting
//etc.

while(true){
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
        if(ds_map_exists(clientmap, string(client))){
            var clientObject = clientmap[? string(client)];
            clientObject.x = xx;
            clientObject.y = yy;
        }else{
            var l = instance_create(xx, yy, obj_other_client);
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
        
        //read inputs from player2
        
        var
        client = buffer_read(buffer, buffer_u16);
        for(i = 0; i < 2; i+= 1){ //should be i < 12
            obj_controller.online_client_movement[i] = buffer_read(buffer, buffer_s16);
        }
        
        with(obj_serverClient){
            if(client_id != client_id_current){
                network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
                //changed to self. ... at part 2 at 14:45
            }
        }
        
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
    if(instance_exists(obj_player2_test)){
        buffer_write(send_buffer, buffer_u16, round(obj_player2_test.x));
        buffer_write(send_buffer, buffer_u16, round(obj_player2_test.y));
    }else if(instance_exists(obj_player_test)){
        buffer_write(send_buffer, buffer_u16, round(obj_player_test.x));
        buffer_write(send_buffer, buffer_u16, round(obj_player_test.y));
    }
    
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
    if(instance_exists(obj_player2_test)){
        for(i = 0; i < 12; i+= 1){
            buffer_write(send_buffer, buffer_s16, obj_controller.online_client_movement_array[i]);
            //buffer_write(send_buffer, buffer_u16, round(obj_player2_test.y));
        }
    }
    
    //network_send_raw(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
    network_send_raw(socket, other.send_buffer, buffer_tell(send_buffer));
