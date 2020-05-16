import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new PlayButton(1),
          new PlayButton(2),
          new PlayButton(3),
          new PlayButton(4),
          new PlayButton(5),
          new PlayButton(6),
          new PlayButton(7),
          new PlayButton(8),
          new PlayButton(9),
          new PlayButton(10),
          new PlayButton(11),
          new PlayButton(12),
        ],
      ),
    );
  }
}

class PlayButton extends StatefulWidget {
  final int i;

  PlayButton(this.i);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool active = false;
  static final AudioCache cachePlayer = new AudioCache();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        onPressed: () async {
          setState(() {
            active = true;
          });

          AudioPlayer audioPlayer =
              await cachePlayer.play('sound${widget.i}.wav');

          audioPlayer.onPlayerCompletion.listen((event) {
            setState(() {
              active = false;
            });
          });
        },
        color: active ? Colors.green : Colors.red,
        child: Text('Note ${widget.i}'),
      ),
    );
  }
}
