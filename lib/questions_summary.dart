import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  final Color lightBlue = Colors.lightBlueAccent;
  final Color pink = Colors.pinkAccent;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20, 35.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: data['user_answer']==data['correct_answer'] ? lightBlue : pink, width: 10)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        backgroundColor: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                      backgroundColor: data['user_answer']==data['correct_answer'] ? lightBlue : pink,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(data['question'] as String,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left)),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['user_answer'] as String,
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.pinkAccent,
                              decoration: TextDecoration.none,
                            )),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['correct_answer'] as String,
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.none,
                            )),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
