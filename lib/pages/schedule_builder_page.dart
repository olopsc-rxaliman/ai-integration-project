import 'package:flutter/material.dart';

class ScheduleBuilderPage extends StatelessWidget {
  const ScheduleBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Builder'),
      ),
      body: const Center(
        child: Text(
          'Schedule Builder Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}