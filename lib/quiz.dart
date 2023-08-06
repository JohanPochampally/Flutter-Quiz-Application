import 'package:flutter/material.dart';
import 'package:quizzed/data/questions.dart';
import 'package:quizzed/landing_page.dart';
import 'package:quizzed/questions_page.dart';
import 'package:quizzed/results_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activePage;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activePage = LandingPage(switchPage);
    super.initState();
  }

  void switchPage() {
    setState(() {
      activePage = QuestionsPage(
        onSelectAnswer: selectedAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      activePage = LandingPage(switchPage);
    });
  }

  void selectedAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activePage = ResultsPage(
          chosenAnswersList: selectedAnswers,
          onRestart: restartQuiz,
        );
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 8, 32, 52),
                Color.fromARGB(255, 76, 237, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activePage,
        ),
      ),
    );
  }
}
