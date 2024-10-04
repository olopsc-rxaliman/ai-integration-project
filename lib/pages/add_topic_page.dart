import "package:flutter/material.dart";


class AddTopicPage extends StatelessWidget {
  const AddTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController topicController = TextEditingController();

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
        backgroundColor: const Color(0xFF97b3f2),
      ),
      backgroundColor: const Color(0xFF97b3f2),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: topicController,
            decoration: InputDecoration(
                labelText: 'Enter Topic',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
          ),
          Spacer(),
          Align(alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  String newTopic = topicController.text;
                  if (newTopic.isNotEmpty) {
                    Navigator.pop(context, newTopic);
                  }
                },
                child: Icon(Icons.add,),
      
              ),

          )
        ],
      ),
      ),
    );
  }
}