import 'package:ai_integration_project/pages/launch_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AI Learn',
      home: LaunchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}