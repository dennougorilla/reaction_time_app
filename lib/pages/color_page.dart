import 'dart:math';

import 'package:flutter/material.dart';

class ColorReactionTestWidget extends StatefulWidget {
  @override
  _ColorReactionTestWidgetState createState() =>
      _ColorReactionTestWidgetState();
}

class _ColorReactionTestWidgetState extends State<ColorReactionTestWidget> {
  bool _testing = false;
  bool _done = false;
  Stopwatch _stopwatch = new Stopwatch();

  void startTest() {
    _testing = true;
    _done = false;
    _stopwatch.reset();
    var rng = new Random();
    Future.delayed(Duration(seconds: 3 + rng.nextInt(5)))
        .then((_) => setState(() {
              _done = true;
              _stopwatch.start();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return !_testing
        ? Container(
            child: Center(
              child: RaisedButton(
                child: Text('Start'),
                onPressed: () {
                  setState(() {
                    startTest();
                  });
                },
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                _stopwatch.isRunning ? _stopwatch.stop() : print('');
              });
            },
            child: Container(
                color: _done ? Colors.green : Colors.red,
                child: _done
                    ? Center(
                        child: _stopwatch.isRunning
                            ? Text('Click',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 120))
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _stopwatch.elapsedMilliseconds.toString() +
                                        'ms',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 120),
                                  ),
                                  RaisedButton(
                                    child: Icon(Icons.replay),
                                    onPressed: () {
                                      setState(() {
                                        startTest();
                                      });
                                    },
                                  )
                                ],
                              ))
                    : Center(
                        child: Text(
                        'wait',
                        style: TextStyle(color: Colors.white, fontSize: 120),
                      ))));
  }
}
