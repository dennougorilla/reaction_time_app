import 'dart:math';

import 'package:flutter/material.dart';

class ValorantReactionTestWidget extends StatefulWidget {
  @override
  _VarolantReactionTestWidgetState createState() =>
      _VarolantReactionTestWidgetState();
}

class _VarolantReactionTestWidgetState
    extends State<ValorantReactionTestWidget> {
  bool isTaped = false;
  bool _testing = false;
  bool _done = false;
  Widget resultMessage;
  Stopwatch _stopwatch = new Stopwatch();

  void startTest() {
    isTaped = false;
    resultMessage = null;
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
                if (!isTaped) {
                  isTaped = true;
                  if (_stopwatch.isRunning) {
                    _stopwatch.stop();
                    resultMessage = FittedBox(
                      fit: BoxFit.fill,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.av_timer, color: Colors.white, size: 64),
                          Text(
                            _stopwatch.elapsedMilliseconds.toString() + 'ms',
                            style:
                                TextStyle(color: Colors.white, fontSize: 120),
                          ),
                          RaisedButton(
                            child: Icon(
                              Icons.replay,
                              size: 26,
                            ),
                            onPressed: () {
                              setState(() {
                                startTest();
                              });
                            },
                          )
                        ],
                      ),
                    );
                  } else {
                    _stopwatch.reset();
                    resultMessage = Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.warning, color: Colors.white, size: 64),
                            Text(
                              'Too Soon!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 120),
                            ),
                            RaisedButton(
                              child: Icon(Icons.replay, size: 26),
                              onPressed: () {
                                setState(() {
                                  startTest();
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }
                } else {}
              });
            },
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _done ? image1 : image2,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(child: resultMessage)));
  }
}
