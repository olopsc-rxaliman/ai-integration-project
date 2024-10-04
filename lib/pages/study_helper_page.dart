import 'package:ai_integration_project/components/topic_button_widget.dart';
import 'package:flutter/material.dart';

class StudyHelperPage extends StatelessWidget {
  const StudyHelperPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Study Helper",
          style: TextStyle(
            fontFamily: "LeagueSpartan",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF97b3f2),
      ),
      backgroundColor: const Color(0xFF97b3f2),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        label: const Text("Add Topic"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          TopicButtonWidget(),
        ],
      )
    );
  }
}