import "package:ai_integration_project/components/gradient_background.dart";
import "package:flutter/material.dart";

class AddTopicPage extends StatelessWidget {
  const AddTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController topicController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Topic",
          style: TextStyle(
            fontFamily: "LeagueSpartan",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF00adff),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          String newTopic = topicController.text;
          if (newTopic.trim().isNotEmpty) {
            // TODO: Add loader overlay in this part
          }
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        label: const Text("Add Topic"),
        icon: const Icon(Icons.add),
      ),
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: topicController,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white,
                    hintText: 'Enter Topic',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
