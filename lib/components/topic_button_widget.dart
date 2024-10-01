import "package:flutter/material.dart";

class TopicButtonWidget extends StatelessWidget {
  const TopicButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1f70b1),
      ),
      child: InkWell(
        onTap: () {
          
        },
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(10),
        highlightColor: Colors.black.withOpacity(0.05),
        splashColor: Colors.black.withOpacity(0.1),
        child: const ListTile(
          title: Text(
            "Introduction to Computing",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}