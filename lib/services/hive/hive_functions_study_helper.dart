import "package:hive_flutter/hive_flutter.dart";
import "package:studyante/hive/hive_constants.dart";

class ToDoListHiveFunctions {
  static final todoListBox = Hive.box(todoListBoxName);

// Add topic
Static Future<void> addTopic({
  required String topic,
  required String description,
}) => todoListBox.add({
  'topic': topic,
  'description': description,
});

// Add Quiz
static Future<void> addQuiz({
    required String quiz,
    required String description,
    required String topicId, // Assuming topicId is a string
  }) => todoListBox.add({
        'quiz': quiz,
        'description': description,
        'topicId': topicId,
      });

  // Delete Topic
  static Future<void> deleteTopic(int key) => todoListBox.delete(key);

  // Delete Quiz
  static Future<void> deleteQuiz(int key) => todoListBox.delete(key);

  // Retrieve
  static Map getSummary() => {
        'taskCount': todoListBox.length,
        'activeCount':
            todoListBox.values.where((item) => item['status'] ==
                TaskStatus.active.index).length,
        'doneCount':
            todoListBox.values.where((item) => item['status'] ==
                TaskStatus.done.index).length,
        'inProgressCount':
            todoListBox.values.where((item) => item['status'] ==
                TaskStatus.inProgress.index).length,
      };

  static List getAllTasks() => todoListBox.keys.map((key) {
        final data = todoListBox.get(key);
        return {
          ...data,
          'key': key,
        };
      }).toList();

  static Map getTask(int key) => todoListBox.get(key);

  // Update
  static Future<void> modifyTask(int key, Map data) =>
      todoListBox.put(key, data);

  // Delete
  static Future<void> deleteTask(int key) => todoListBox.delete(key);
  static Future<void> deleteTheseTasks(List keys) =>