import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import "package:quiz_app/start.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(home: activeScreen=='start-screen' ? Start(const Color.fromARGB(255, 78, 13, 151),
        const Color.fromARGB(255, 107, 15, 168), () {switchScreen(); }) :const Questions() );
  }
}
