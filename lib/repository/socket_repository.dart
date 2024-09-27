import 'package:docs_clone/client/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketRepository {
  final _socketClient = SocketClient.instance.socket!;

  // Getter for the socket instance
  Socket get socketClient => _socketClient;

  // Join a room (document)
  void joinRoom(String documentId) {
    print('Attempting to join room with ID: $documentId');
    _socketClient.emit('join', documentId);

    // Optional: Listen for server confirmation that the room was joined
    _socketClient.on('joinedRoom', (data) {
      print('Successfully joined room: $data');
    });

    // Optional: Handle errors
    _socketClient.on('error', (error) {
      print('Error joining room: $error');
    });
  }

  void typing(Map<String, dynamic>data){ //data can be string map anything
    _socketClient.emit('typing',data);
  }

  void changeListener(Function(Map<String ,dynamic>) func){
    _socketClient.on('changes',(data)=> func(data));
  }


}
