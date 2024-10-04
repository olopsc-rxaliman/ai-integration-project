import "package:ai_integration_project/components/quiz_tile_widget.dart";
import "package:flutter/material.dart";

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final answerShowStates = [
    false,
    false,
    false,
    false,
  ];
  bool isShowAnswersButtonToggled = false;
  int showAnswerCount = 0;

  void toggleAnswerVisibility(int index) {
    setState(() {
      if (isShowAnswersButtonToggled) {
        isShowAnswersButtonToggled = !isShowAnswersButtonToggled;
      }
      if (answerShowStates[index] == true) {
        showAnswerCount -= 1;
      }
      else {
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
      for (int a=0; a<answerShowStates.length; a++) {
        answerShowStates[a] = isShowAnswersButtonToggled;
      }
      showAnswerCount = isShowAnswersButtonToggled ? answerShowStates.length : 0;
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
        backgroundColor: const Color(0xFF97b3f2),
        foregroundColor: Colors.black,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              toggleAllAnswerVisibility();
            },
            icon: Icon(
              isShowAnswersButtonToggled ? Icons.visibility_off : Icons.visibility
            ),
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
      backgroundColor: const Color(0xFF97b3f2),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          QuizTileWidget(
            question: "Question 1",
            choices: "A. Choice 1\nB. Choice 2\nC. Choice 3\nD. Choice 4",
            answer: "A",
            showAnswer: answerShowStates[0],
            showAnswerFunction: () => toggleAnswerVisibility(0),
          ),
          QuizTileWidget(
            question: "Question 2",
            choices: "A. Choice 1\nB. Choice 2\nC. Choice 3\nD. Choice 4",
            answer: "B",
            showAnswer: answerShowStates[1],
            showAnswerFunction: () => toggleAnswerVisibility(1),
          ),
          QuizTileWidget(
            question: "Question 3",
            choices: "A. Choice 1\nB. Choice 2\nC. Choice 3\nD. Choice 4",
            answer: "C",
            showAnswer: answerShowStates[2],
            showAnswerFunction: () => toggleAnswerVisibility(2),
          ),
          QuizTileWidget(
            question: "Question 4",
            choices: "A. Choice 1\nB. Choice 2\nC. Choice 3\nD. Choice 4",
            answer: "D",
            showAnswer: answerShowStates[3],
            showAnswerFunction: () => toggleAnswerVisibility(3),
          ),
        ],
      ),
    );
  }
}