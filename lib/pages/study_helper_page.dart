import 'package:ai_integration_project/components/gradient_background.dart';
import 'package:ai_integration_project/components/loading_overlay.dart';
import 'package:ai_integration_project/components/topic_button_widget.dart';
import 'package:ai_integration_project/services/hive/hive_functions_study_helper.dart';
import 'package:flutter/material.dart';
import 'study_helper/add_topic_page.dart';

class StudyHelperPage extends StatefulWidget {
  const StudyHelperPage({super.key});

  @override
  State<StudyHelperPage> createState() => _StudyHelperPageState();
}

class _StudyHelperPageState extends State<StudyHelperPage> {
  late List topicList;

  refreshList() {
    setState(() {
      topicList = StudyHelperHiveFunctions.getAllTopics();
    });
  }

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      subtext: "Generating content",
      child: Scaffold(
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
                context,
                MaterialPageRoute(
                    builder: (context) => AddTopicPage(
                          onSubmit: () {
                            refreshList();
                          },
                        )),
              );
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
          body: GradientBackground(
            child: topicList.isEmpty
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Tap on  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        const Text(
                          "  to add a study topic",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: topicList.length,
                    itemBuilder: (context, index) => TopicButtonWidget(
                      topicContent: topicList[index],
                      refresh: () {
                        refreshList();
                      },
                    ),
                  ),
          )),
    );
  }
}
