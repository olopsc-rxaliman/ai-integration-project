import 'package:flutter/material.dart';
import 'package:openai/openai.dart';

class AddTopicPage extends StatefulWidget {
  const AddTopicPage({super.key});

  @override
  State<AddTopicPage> createState() => _AddTopicPageState();
}

class _AddTopicPageState extends State<AddTopicPage> {
  final TextEditingController topicController = TextEditingController();
  final List<String> topicBreakdowns = [];
  final List<String> breakdownDescriptions = [];

  Future<void> generateTopicBreakdown(String topic) async {
    try {
      final completion = await OpenAI.complete(
        prompt: "Generate a breakdown of the topic \"$topic\".",
        model: "text-davinci-003",
      );

      setState(() {
        topicBreakdowns.clear();
        breakdownDescriptions.clear();

        for (final choice in completion.choices) {
          topicBreakdowns.add(choice.text);
          breakdownDescriptions.add("Description for breakdown ${topicBreakdowns.length}"); // Placeholder, replace with actual description generation
        }
      });
    } catch (error) {
      print("Error generating topic breakdown: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
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
        onPressed: () async {
          String newTopic = topicController.text;
          if (newTopic.isNotEmpty) {
            await generateTopicBreakdown(newTopic);
            // Navigate to the next page with the generated topic and breakdowns
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicPage(
                  topic: newTopic,
                  topicBreakdowns: topicBreakdowns,
                  breakdownDescriptions: breakdownDescriptions,
                ),
              ),
            );
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
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Display generated topic breakdowns
            if (topicBreakdowns.isNotEmpty)
              Column(
                children: [
                  Text(
                    "Generated Topic Breakdowns:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  for (int i = 0; i < topicBreakdowns.length; i++)
                    Row(
                      children: [
                        Text(
                          "Breakdown ${i + 1}: ${topicBreakdowns[i]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          breakdownDescriptions[i],
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}