import "dart:io";

import "package:ai_integration_project/components/gradient_background.dart";
import "package:ai_integration_project/components/icon_alert_dialog.dart";
import "package:ai_integration_project/components/topic_tile_widget.dart";
import "package:ai_integration_project/pages/study_helper/quiz_page.dart";
import "package:ai_integration_project/services/gemini/gemini_study_helper.dart";
import "package:ai_integration_project/services/hive/hive_functions_study_helper.dart";
import "package:flutter/material.dart";
import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";

class TopicPage extends StatefulWidget {
  final Map topicContent;
  final Function() refresh;
  late final GeminiGenerateQuestions gemini;
  bool isLoading = false;

  TopicPage({
    super.key,
    required this.topicContent,
    required this.refresh,
  }) {
    gemini = GeminiGenerateQuestions();
  }

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  void generateContentLayout(List<Widget> content, Map map, int level) {
    content.add(
      TopicTileWidget(
        title: map['name'],
        description: map['description'],
        level: level,
      ),
    );
    if (map.containsKey('breakdowns')) {
      for (final item in map['breakdowns']) {
        generateContentLayout(content, item, level + 1);
      }
      content.add(const SizedBox(height: 4));
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.topicContent['content'];
    List<Widget> breakdownWidgets = [];
    generateContentLayout(breakdownWidgets, content, 1);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => IconAlertDialog(
                  icon: Icons.delete,
                  message: "Are you sure you want to delete this topic?",
                  confirmText: "No",
                  actionText: "Yes, I'm sure",
                  onActionButtonPressed: () {
                    StudyHelperHiveFunctions.deleteTopic(
                        widget.topicContent['key']);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    widget.refresh();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () async {
              try {
                Map? updatedData;
                if (widget.topicContent['quiz'] == null) {
                  setState(() {
                    widget.isLoading = true;
                  });
                  if (await InternetConnection().hasInternetAccess == false) {
                    throw SocketException;
                  }
                  final generatedContent =
                      await widget.gemini.generateQuestions(content);
                  updatedData = {
                    ...widget.topicContent,
                    "quiz": generatedContent,
                  };
                  await StudyHelperHiveFunctions.modifyTopic(
                    widget.topicContent['key'],
                    updatedData,
                  );
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => QuizPage(
                          questions: updatedData != null
                              ? updatedData['quiz']
                              : widget.topicContent['quiz'],
                        )));
              } catch (e) {
                if (e == SocketException) {
                  showDialog(
                    context: context,
                    builder: (context) => const IconAlertDialog(
                      icon: Icons.signal_wifi_off,
                      message:
                          "It seems that your device had an internet connection problem. Please make sure to check your connection and try again.",
                      confirmText: "Got it",
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => const IconAlertDialog(
                      icon: Icons.help_outline,
                      message:
                          "An error has occured. Please try again later. Contact the developers if this problem still persists.",
                      confirmText: "Got it",
                    ),
                  );
                }
              } finally {
                widget.refresh();
                setState(() {
                  widget.isLoading = false;
                });
              }
            },
            icon: widget.isLoading ? const SizedBox() : const Icon(Icons.check_box_outlined),
            label: widget.isLoading
            ? const SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2,
              ),
            )
            : Text(
              widget.topicContent['quiz'] == null
                  ? "Generate Quiz"
                  : "Take Quiz",
              style: const TextStyle(
                fontFamily: "LeagueSpartan",
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          const SizedBox(width: 15),
        ],
        backgroundColor: const Color(0xFF00adff),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 15,
                  bottom: 12,
                ),
                child: Column(
                  children: breakdownWidgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
