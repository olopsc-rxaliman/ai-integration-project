import "package:flutter/material.dart";

class TopicTileWidget extends StatelessWidget {
  final String title;
  final String description;
  final int level;

  const TopicTileWidget({
    super.key,
    required this.title,
    required this.description,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: level == 1
              ? 0
              : level == 2
                  ? 0
                  : level == 3
                      ? 8
                      : 16,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: level == 1
                      ? 22
                      : level == 2
                          ? 18
                          : 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: null,
              ),
              SizedBox(height: level == 1 ? 2 : 0),
              description.isNotEmpty
              ? Text(
                description,
                style: TextStyle(
                  fontSize: level == 1
                      ? 17.0
                      : level == 2
                          ? 16
                          : 15,
                ),
              )
              : const SizedBox(),
              SizedBox(
                height: level == 1 ? 10 : 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
