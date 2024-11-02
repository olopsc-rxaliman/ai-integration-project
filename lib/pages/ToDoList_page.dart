import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: const Center(
        child: Text(
          'To-Do List Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
