import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Socket? socket;
String connStatus = "";

class ConnectButton extends StatefulWidget {
  @override
  _ConnectButtonState createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  void connectToServer() {
    try {
      socket = io('http://192.168.43.21:8080', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket?.connect();
      socket?.onConnect((_) {
        print('connect');
        setState(() {
          connStatus = "Connected";
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ElevatedButton(onPressed: connectToServer, child: Text('connect')),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Text('$connStatus', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}

sendMessage1(startAngle) {
  socket?.emit("m3", startAngle);
}

sendMessage2(startAngle) {
  socket?.emit("m2", startAngle);
}

sendMessage3(startAngle) {
  socket?.emit("m1", startAngle);
}
// sendMessage4(startAngle) {
//   socket?.emit("m4", startAngle);
// }

//
// // Handle socket events
// socket?.on('connect', (_) => print('connect: ${socket?.id}'));
// socket.on('location', handleLocationListen);
// socket.on('typing', handleTyping);
// socket.on('message', handleMessage);
// socket.on('disconnect', (_) => print('disconnect'));
// socket.on('fromServer', (_) => print(_));

// void traj(){
//   var q = [10,-20,30,-40,50,-70,80,-90];
//   for(int i = 0 ; i <= 7; i++ ) {
//     int ang = q[i];
//     socket?.emit("m1", ang );
//     // sleep(const Duration(seconds: 2));
//   };
// }
// // Send Location to Server
// sendLocation(Map<String, dynamic> data) {
//   socket.emit("location", data);
// }
//
// // Listen to Location updates of connected users from server
// handleLocationListen(Map<String, dynamic> data) async {
//   print(data);
// }
//
// // Send update of user's typing status
// sendTyping(bool typing) {
//   socket.emit("typing",
//       {
//         "id": socket.id,
//         "typing": typing,
//       });
// }
//
// // Listen to update of typing status from connected users
// void handleTyping(Map<String, dynamic> data) {
//   print(data);
// }

// Send a Message to the server
// // Listen to all message events from connected users
// void handleMessage(Map<String, dynamic> data) {
//   print(data);
// }
