import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_model.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/quiz.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;

  List<String> selectedAnswer = [];

  void returnBack(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Quiz("question-screen")),
    );

  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      ResultsScreen(chosenAnswer: selectedAnswer);
    }
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 78, 13, 151),
        Color.fromARGB(255, 107, 15, 168)
      ])),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(summaryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  icon: Image.asset(
                    'assets/images/refresh.png',
                    height: 18,
                    width: 18,
                  ),
                  onPressed: () {
                    returnBack(context);
                  },
                  label: Text(
                    "Restart Quiz",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
