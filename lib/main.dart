import 'package:flutter/material.dart';

//import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Simple music app"))),
        body: Buttons(),
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final player = new AudioCache();
  static List<Color> colors = [Colors.blue, Colors.green, Colors.red];

  void playNote(int whichOne) {
    player.play('sound$whichOne.wav');
  }

  int currentIndex = 0;
  int colorCount = colors.length;

  Widget createButton(int i) {
    return Expanded(
        child: RaisedButton(
      onPressed: () {
        playNote(i);
        setState(() {
          if (currentIndex == 0 || currentIndex == colorCount - 1) {
            currentIndex = 1;
          }
        });
      },
      color: colors[currentIndex],
      child: Text('Note$i'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          createButton(1),
          createButton(2),
          createButton(3),
          createButton(4),
          createButton(5),
          createButton(6),
          createButton(7),
          createButton(8),
          createButton(9),
          createButton(10),
          createButton(11),
          createButton(12),
        ],
      ),
    );
  }
}
