import 'package:flutter/material.dart';
import 'dart:math';

import 'package:reaction_time_app/pages/color_page.dart';
import 'package:reaction_time_app/pages/valorant_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reaction time lab',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reaction Time Lab'),
        ),
        body: ValorantReactionTestWidget(),
      ),
    );
  }
}
