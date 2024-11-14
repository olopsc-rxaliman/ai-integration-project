import "package:ai_integration_project/components/gradient_background.dart";
import "package:ai_integration_project/services/hive/hive_functions_study_helper.dart";
import "package:flutter/material.dart";

class AddTopicPage extends StatelessWidget {
  final TextEditingController topicController = TextEditingController();
  final Function() onSubmit;

  AddTopicPage({
    super.key,
    required this.onSubmit,
  });

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
        backgroundColor: const Color(0xFF00adff),
        foregroundColor: Colors.white,
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
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  hintText: 'Topic Name',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        if (topicController.text.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Kindly add a topic name")));
                        } else {
                          StudyHelperHiveFunctions.addTopic(
                              topicController.text);
                          onSubmit();
                          Navigator.of(context).pop();
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Add Topic",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
