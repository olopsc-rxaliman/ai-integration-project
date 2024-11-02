import 'package:ai_integration_project/components/app_button_widget.dart';
import 'package:ai_integration_project/components/gradient_background.dart';
import 'package:ai_integration_project/components/home_drawer.dart';
import 'package:ai_integration_project/pages/todolist_page.dart';
import 'package:ai_integration_project/pages/schedule_builder_page.dart';
import "package:flutter/material.dart";
import 'study_helper/study_helper_page.dart';

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
          children: [
            AppButtonWidget(
              title: "Study Helper",
              icon: Image.asset(
                'lib/resources/images/study-helper-icon.png',
                scale: 8,
                isAntiAlias: true,
              ),
              nextPage: const StudyHelperPage(),
            ),
            AppButtonWidget(
              title: "To-Do List",
              icon: Image.asset(
                'lib/resources/images/todolist-icon.png',
                scale: 8,
                isAntiAlias: true,
              ),
              nextPage: const ToDoListPage(),
            ),
            AppButtonWidget(
              title: "Schedule Builder",
              icon: Image.asset(
                'lib/resources/images/schedule-builder-icon.png',
                scale: 8,
                isAntiAlias: true,
              ),
              nextPage: const ScheduleBuilderPage(),
            ),
          ],
        ),
      ),
    );
  }
}
