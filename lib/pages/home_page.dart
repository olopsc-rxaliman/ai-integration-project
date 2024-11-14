import 'package:ai_integration_project/components/app_button_widget.dart';
import 'package:ai_integration_project/components/gradient_background.dart';
import 'package:ai_integration_project/components/home_drawer.dart';
import 'package:ai_integration_project/pages/todolist_page.dart';
import 'package:ai_integration_project/pages/schedule_builder_page.dart';
import "package:flutter/material.dart";
import 'study_helper_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00adff),
        foregroundColor: Colors.white,
        title: const Text(
          "Home",
          style: TextStyle(
            fontFamily: "LeagueSpartan",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          // TODO: Make some easter eggs when this is pressed multiple times
          Image.asset(
            'lib/resources/images/main-app-logo-transparent.png',
            scale: 30,
            isAntiAlias: true,
          ),
          const SizedBox(width: 15)
        ],
      ),
      drawer: const HomeDrawer(),
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          children: const [
            AppButtonWidget(
              title: "Study Helper",
              iconPath: 'lib/resources/images/study-helper-icon.png',
              nextPage: StudyHelperPage(),
            ),
            AppButtonWidget(
              title: "To-Do List",
              iconPath: 'lib/resources/images/todolist-icon.png',
              nextPage: ToDoListPage(),
            ),
            AppButtonWidget(
              title: "Schedule Builder",
              iconPath: 'lib/resources/images/schedule-builder-icon.png',
              nextPage: ScheduleBuilderPage(),
            ),
          ],
        ),
      ),
    );
  }
}
