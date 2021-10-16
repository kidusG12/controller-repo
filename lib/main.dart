import 'package:control/sliders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:control/connection.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Robot control"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConnectButton(),
            SizedBox(height: 35),

            Text('Joint 1'),
            SizedBox(height: 5),
            Slider1(),
            SizedBox(height: 15),

            Text('Joint 2'),
            SizedBox(height: 5),
            Slider2(),
            SizedBox(height: 15),

            Text('Joint 3'),
            SizedBox(height: 5),
            Slider3(),
            // SizedBox(height: 15),
            //
            // Text('Joint 4'),
            // SizedBox(height: 5),
            // Slider4(),
          ],
        ),
      ),
      floatingActionButton: Reset(),
    );
  }
}

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  void reset() {
    sendMessage1(0);
    sendMessage2(-25);
    sendMessage3(25);
    // sendMessage4(0);
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: reset,
      child: Icon(Icons.replay),
    );
  }
}
