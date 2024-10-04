import "package:flutter/material.dart";

class QuizTileWidget extends StatelessWidget {
  final String question;
  final String choices;
  final String answer;
  final bool showAnswer;
  final Function() showAnswerFunction;

  const QuizTileWidget({
    super.key,
    required this.question,
    required this.choices,
    required this.answer,
    required this.showAnswer,
    required this.showAnswerFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              choices,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            showAnswer ?
            Row(
              children: [
                const Text(
                  "Answer: ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            )
            : const SizedBox(),
            Center(
              child: ElevatedButton.icon(
                onPressed: showAnswerFunction,
                icon: Icon(
                  showAnswer ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  showAnswer ? "Hide Answer" : "Show Answer",
                  style: const TextStyle(
                    fontFamily: "LeagueSpartan",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1f70b1),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}