import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatelessWidget {
  const Start(this.color1, this.color2, this.startQuiz, {super.key});

  final Color color1;
  final Color color2;
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                width: 250,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 70,
              ),
               Text(
                "Learn Flutter the Fun way!",
                style: GoogleFonts.montserrat(textStyle:const TextStyle(color: Colors.white, fontSize: 20)),
               ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 107, 15, 168))),
                onPressed: () {

                  startQuiz();
                },
                label: const Text(
                  "Start Quiz",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.arrow_right_alt),
              )
            ],
          ),
        ),
      ),
    );
  }
}
