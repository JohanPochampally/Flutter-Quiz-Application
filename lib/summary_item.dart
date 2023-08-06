import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzed/question_index.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.dataItem});
  final Map<String, Object> dataItem;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        dataItem['chosen_answer'] == dataItem['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        QuestionIndex(
          questionIndex: dataItem['question_index'] as int,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(
          height: 25,
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                dataItem['question'] as String,
                style: GoogleFonts.titilliumWeb(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                dataItem['correct_answer'] as String,
                style: GoogleFonts.titilliumWeb(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 38, 237, 44),
                ),
              ),
              Text(
                dataItem['chosen_answer'] as String,
                style: GoogleFonts.titilliumWeb(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isCorrectAnswer
                      ? const Color.fromARGB(255, 38, 237, 44)
                      : const Color.fromARGB(255, 208, 66, 56),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
