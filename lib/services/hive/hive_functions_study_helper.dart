import "package:hive_flutter/hive_flutter.dart";

class StudyHelperHiveFunctions {
  static final topicBox = Hive.box('topicBox');

  // Add topic
  static Future<void> addTopic(String topic) => topicBox.add({
        'name': topic,
        'content': null,
        'quiz': null,
      });

  // Get topics
  static List getAllTopics() => topicBox.keys.map((key) {
        final data = topicBox.get(key);
        return {
          ...data,
          'key': key,
        };
      }).toList();

  // Modify topic content
  static Future<void> modifyTopic(dynamic key, Map data) =>
      topicBox.put(key, data);

  // Delete topic
  static deleteTopic(dynamic key) => topicBox.delete(key);
}

// class ToDoListHiveFunctions {
//   static final topicBox = Hive.box('topicBox');

// // Add topic
// static Future<void> addTopic({
//   required String topic,
//   required String description,
// }) => todoListBox.add({
//   'topic': topic,
//   'description': description,
// });

// // Add Quiz
// static Future<void> addQuiz({
//     required String quiz,
//     required String description,
//     required String topicId, // Assuming topicId is a string
//   }) => todoListBox.add({
//         'quiz': quiz,
//         'description': description,
//         'topicId': topicId,
//       });

//   // Delete Topic
//   static Future<void> deleteTopic(int key) => todoListBox.delete(key);

//   // Delete Quiz
//   static Future<void> deleteQuiz(int key) => todoListBox.delete(key);

//   // Retrieve
//   static Map getSummary() => {
//         'taskCount': todoListBox.length,
//         'activeCount':
//             todoListBox.values.where((item) => item['status'] ==
//                 TaskStatus.active.index).length,
//         'doneCount':
//             todoListBox.values.where((item) => item['status'] ==
//                 TaskStatus.done.index).length,
//         'inProgressCount':
//             todoListBox.values.where((item) => item['status'] ==
//                 TaskStatus.inProgress.index).length,
//       };

//   static List getAllTasks() => todoListBox.keys.map((key) {
//         final data = todoListBox.get(key);
//         return {
//           ...data,
//           'key': key,
//         };
//       }).toList();

//   static Map getTask(int key) => todoListBox.get(key);

//   // Update
//   static Future<void> modifyTask(int key, Map data) =>
//       todoListBox.put(key, data);

//   // Delete
//   static Future<void> deleteTask(int key) => todoListBox.delete(key);
//   static Future<void> deleteTheseTasks(List keys) =>