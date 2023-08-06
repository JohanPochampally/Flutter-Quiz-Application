import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  final int questionIndex;
  final bool isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 38, 237, 44)
            : const Color.fromARGB(255, 208, 66, 56),
      ),
      child: Text(
        '$questionNumber',
        style: GoogleFonts.titilliumWeb(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
