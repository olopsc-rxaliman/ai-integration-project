import "dart:io";

import "package:ai_integration_project/components/icon_alert_dialog.dart";
import "package:ai_integration_project/pages/study_helper/topic_page.dart";
import "package:ai_integration_project/services/gemini/gemini_study_helper.dart";
import "package:ai_integration_project/services/hive/hive_functions_study_helper.dart";
import "package:flutter/material.dart";
import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";
import "package:loader_overlay/loader_overlay.dart";

class TopicButtonWidget extends StatelessWidget {
  final Map topicContent;
  late final GeminiGenerateBreakdowns gemini;
  final Function() refresh;

  TopicButtonWidget({
    super.key,
    required this.topicContent,
    required this.refresh,
  }) {
    gemini = GeminiGenerateBreakdowns();
  }

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
          onTap: () async {
            try {
              Map? updatedData;
              if (topicContent['content'] == null) {
                context.loaderOverlay.show();
                if (await InternetConnection().hasInternetAccess == false) {
                  context.loaderOverlay.hide();
                  throw SocketException;
                }
                final generatedContent =
                    await gemini.generateBreakdowns(topicContent['name']);
                updatedData = {
                  ...topicContent,
                  "content": generatedContent,
                };
                await StudyHelperHiveFunctions.modifyTopic(
                    topicContent['key'], updatedData);
                context.loaderOverlay.hide();
              }
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TopicPage(
                        topicContent: updatedData ?? topicContent,
                        refresh: refresh,
                      )));
              refresh();
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
                  builder: (context) => IconAlertDialog(
                    icon: Icons.help_outline,
                    message:
                        "An error has occured. Kindly double-check how you construct the topic. You may choose to delete this topic to create a new one. Contact the developers if you believe this is a mistake.",
                    confirmText: "Got it",
                    actionText: "Delete topic",
                    onActionButtonPressed: () {
                      StudyHelperHiveFunctions.deleteTopic(topicContent['key']);
                      Navigator.of(context).pop();
                      refresh();
                    },
                  ),
                );
              }
            } finally {
              context.loaderOverlay.hide();
            }
          },
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.black.withOpacity(0.05),
          splashColor: Colors.black.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Text(
              topicContent['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
