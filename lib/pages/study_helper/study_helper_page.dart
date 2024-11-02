import 'package:ai_integration_project/components/gradient_background.dart';
import 'package:ai_integration_project/components/topic_button_widget.dart';
import 'package:flutter/material.dart';
import 'add_topic_page.dart';

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
        backgroundColor: const Color(0xFF00adff),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context)=> const AddTopicPage()),
          );
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: const GradientBackground(
        // child: ListView.builder(
        //   physics: const BouncingScrollPhysics(),
        //   padding: const EdgeInsets.symmetric(horizontal: 12),
        //   itemCount: 3,
        //   itemBuilder: (context, index) => const TopicButtonWidget(),
        // ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tap on ",
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                " to add a study topic",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      )
    );
  }
}