import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;
  final String choosedAnswer = "";

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(text,
          style: GoogleFonts.montserrat(), textAlign: TextAlign.center),
    );
  }
}
