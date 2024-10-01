import 'package:ai_integration_project/components/app_button_widget.dart';
import 'package:ai_integration_project/components/home_drawer.dart';
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
          "App Dashboard",
          style: TextStyle(
            fontFamily: "LeagueSpartan",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      drawer: const HomeDrawer(),
      backgroundColor: const Color(0xFF00adff),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppButtonWidget(
                  title: "Study Helper",
                  icon: Image.asset(
                    'lib/resources/images/gemini.png',
                    scale: 3,
                  ),
                  nextPage: const StudyHelperPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

