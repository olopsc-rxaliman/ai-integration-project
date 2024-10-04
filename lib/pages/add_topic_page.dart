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
        backgroundColor: const Color(0xFF97b3f2),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String newTopic = topicController.text;
          if (newTopic.isNotEmpty) {
            Navigator.pop(context, newTopic);
          }
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color(0xFF97b3f2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: topicController,
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                hintText: 'Enter Topic',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}