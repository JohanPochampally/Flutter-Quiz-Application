import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzed/data/questions.dart';
import 'package:quizzed/questions_summary.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.chosenAnswersList,
    required this.onRestart,
  });

  final List<String> chosenAnswersList;
  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswersList.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'chosen_answer': chosenAnswersList[i],
          'correct_answer': questions[i].correctAnswer,
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final summaryData = getSummaryData();
    final correctAnswerCount = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You\'ve answered $correctAnswerCount out of $totalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.titilliumWeb(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            QuestionsSummary(getSummaryData()),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.refresh,
              ),
              label: Text(
                "Restart Quiz",
                style: GoogleFonts.titilliumWeb(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
