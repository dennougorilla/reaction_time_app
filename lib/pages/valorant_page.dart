import 'dart:math';

import 'package:flutter/material.dart';

class ValorantReactionTestWidget extends StatefulWidget {
  @override
  _VarolantReactionTestWidgetState createState() =>
      _VarolantReactionTestWidgetState();
}

class _VarolantReactionTestWidgetState
    extends State<ValorantReactionTestWidget> {
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
    var image1 = AssetImage('1t.png');
    var image2 = AssetImage('1f.png');
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _done ? image1 : image2,
                    fit: BoxFit.cover,
                  ),
                ),
                child: _done
                    ? Center(
                        child: _stopwatch.isRunning
                            ? Text('',
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
                        '',
                        style: TextStyle(color: Colors.white, fontSize: 120),
                      ))));
  }
}
