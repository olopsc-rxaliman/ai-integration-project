import "package:ai_integration_project/components/topic_tile_widget.dart";
import "package:ai_integration_project/pages/quiz_page.dart";
import "package:flutter/material.dart";

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QuizPage())
              );
            },
            icon: const Icon(Icons.check_box_outlined),
            label: const Text(
              "Take Quiz",
              style: TextStyle(
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
        backgroundColor: const Color(0xFF97b3f2),
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFF97b3f2),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          TopicTileWidget(
            title: "Introduction to Computing",
            description: "- Breakdown 1\n- Breakdown 2\n- Breakdown 3\n- Breakdown 4\n- Breakdown 5\n- Breakdown 6\n- Breakdown 7",
          ),
          TopicTileWidget(
            title: "Breakdown 1",
            description: "Description",
          ),
          TopicTileWidget(
            title: "Breakdown 2",
            description: "Description",
          ),
          TopicTileWidget(
            title: "Breakdown 3",
            description: "Description",
          ),
          TopicTileWidget(
            title: "Breakdown 4",
            description: "Description",
          ),
          TopicTileWidget(
            title: "Breakdown 5",
            description: "Description",
          ),
          TopicTileWidget(
            title: "Breakdown 6",
            description: "Description",
          ),
          TopicTileWidget(
            title: "Breakdown 7",
            description: "Description",
          ),
        ],
      ),
    );
  }
}