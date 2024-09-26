import 'package:flutter/material.dart';

class StudyHelperPage extends StatelessWidget {
  const StudyHelperPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study Helper"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyHelperPage())
              );
            }
            , child: const Text('Topic'),
            ),
          ], 
      ),
      );
  }
}