import 'package:flutter/material.dart';
import 'package:control/connection.dart';

class Slider1 extends StatefulWidget {
  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  static double lowerValue = -180;
  static double upperValue = 180;
  double startAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
        divisions: 360,
        min: lowerValue,
        max: upperValue,
        value: startAngle,
        onChanged: (val) {
          setState(() {
            startAngle = val;
          });
          sendMessage1(startAngle);
        });
  }
}

class Slider2 extends StatefulWidget {
  @override
  _Slider2State createState() => _Slider2State();
}

class _Slider2State extends State<Slider2> {
  static double lowerValue = -100;
  static double upperValue = 50;
  double startAngle = -25;

  @override
  Widget build(BuildContext context) {
    return Slider(
        divisions: 360,
        min: lowerValue,
        max: upperValue,
        value: startAngle,
        onChanged: (val) {
          setState(() {
            startAngle = val;
          });
          sendMessage2(startAngle);
        });
  }
}

class Slider3 extends StatefulWidget {
  @override
  _Slider3State createState() => _Slider3State();
}

class _Slider3State extends State<Slider3> {
  static double lowerValue = 25;
  static double upperValue = 338;
  double startAngle = 25;

  @override
  Widget build(BuildContext context) {
    return Slider(
        divisions: 360,
        min: lowerValue,
        max: upperValue,
        value: startAngle,
        onChanged: (val) {
          setState(() {
            startAngle = val;
          });
          sendMessage3(startAngle);
        });
  }
}

// label: startAngle.round().toString(),
// class Slider4 extends StatefulWidget {
//   @override
//   _Slider4State createState() => _Slider4State();
// }
//
// class _Slider4State extends State<Slider4> {
//   static double lowerValue = 0;
//   static double upperValue = 360;
//   double startAngle = 180;
//
//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//         divisions: 360,
//         min: lowerValue,
//         max: upperValue,
//         value: startAngle,
//         onChanged: (val) {
//           setState(() {
//             startAngle = val;
//           });
//           sendMessage4(startAngle);
//         });
//   }
// }
