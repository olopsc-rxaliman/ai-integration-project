import "package:ai_integration_project/components/gradient_background.dart";
import "package:ai_integration_project/components/quiz_tile_widget.dart";
import "package:flutter/material.dart";

class QuizPage extends StatefulWidget {
  final List questions;

  const QuizPage({
    super.key,
    required this.questions,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final List questions;
  late final List answerShowStates;
  bool isShowAnswersButtonToggled = false;
  int showAnswerCount = 0;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    answerShowStates = List.filled(questions.length, false);
  }

  void toggleAnswerVisibility(int index) {
    setState(() {
      if (isShowAnswersButtonToggled) {
        isShowAnswersButtonToggled = !isShowAnswersButtonToggled;
      }
      if (answerShowStates[index] == true) {
        showAnswerCount -= 1;
      } else {
        showAnswerCount += 1;
      }
      if (showAnswerCount == answerShowStates.length) {
        isShowAnswersButtonToggled = true;
      }
      answerShowStates[index] = !answerShowStates[index];
    });
  }

  void toggleAllAnswerVisibility() {
    setState(() {
      isShowAnswersButtonToggled = !isShowAnswersButtonToggled;
      for (int a = 0; a < answerShowStates.length; a++) {
        answerShowStates[a] = isShowAnswersButtonToggled;
      }
      showAnswerCount =
          isShowAnswersButtonToggled ? answerShowStates.length : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz",
          style: TextStyle(
            fontFamily: "LeagueSpartan",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF00adff),
        foregroundColor: Colors.white,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              toggleAllAnswerVisibility();
            },
            icon: Icon(isShowAnswersButtonToggled
                ? Icons.visibility_off
                : Icons.visibility),
            label: Text(
              isShowAnswersButtonToggled ? "Hide Answers" : "Show Answers",
              style: const TextStyle(
                fontFamily: "LeagueSpartan",
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, index) => QuizTileWidget(
            question: questions[index]['question'],
            choices: questions[index]['choices'],
            answer: questions[index]['answer'],
            showAnswer: answerShowStates[index],
            showAnswerFunction: () => toggleAnswerVisibility(index),
          ),
        ),
      ),
    );
  }
}
