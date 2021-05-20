import 'package:flutter/material.dart';

import 'screens/quiz.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData.dark(),
      home: Quiz(),
    );
  }
}

