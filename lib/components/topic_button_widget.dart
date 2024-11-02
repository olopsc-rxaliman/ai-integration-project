import "package:ai_integration_project/pages/study_helper/topic_page.dart";
import "package:flutter/material.dart";

class TopicButtonWidget extends StatelessWidget {
  const TopicButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TopicPage())
            );
          },
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.black.withOpacity(0.05),
          splashColor: Colors.black.withOpacity(0.1),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Text(
              "Introduction to Computing",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}