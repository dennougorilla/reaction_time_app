import 'dart:math';
import 'dart:html' as html;

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
        ? LayoutBuilder(builder: (context, constrains) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: constrains.maxWidth < 600
                      ? AssetImage('Vertical_Viper.jpg')
                      : AssetImage('Art_VALORANT.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Text(
                    'PLAY',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 128,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      startTest();
                    });
                  },
                ),
              ),
            );
          })
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
                          Container(
                            width: 300,
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                                ),
                                RaisedButton(
                                  color: Colors.blue,
                                  child: Text('tweet'),
                                  onPressed: () {
                                    html.window.open(
                                        'http://twitter.com/share?url=&text=You need to react faster than ${_stopwatch.elapsedMilliseconds.toString()}ms to kill me. &hashtags=valorant',
                                        'twitter');
                                    setState(() {
                                      startTest();
                                    });
                                  },
                                ),
                              ],
                            ),
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
