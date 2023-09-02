import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_model.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';
import "package:quiz_app/start.dart";

class Quiz extends StatefulWidget {
  const Quiz(this.startingScreen, {super.key});

  final String startingScreen;

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen = 'start-screen';
  

  List<String> selectedAnswer = [];
  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        // selectedAnswer = [];
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: activeScreen == widget.startingScreen
            ? Start(const Color.fromARGB(255, 78, 13, 151),
                const Color.fromARGB(255, 107, 15, 168), () {
                switchScreen();
              })
            : activeScreen == 'results-screen'
                ? ResultsScreen(
                    chosenAnswer: selectedAnswer,
                  )
                : Questions(
                    onSelectAnswer: chooseAnswer,
                  ));
  }
}
