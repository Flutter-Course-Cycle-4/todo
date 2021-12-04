import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksProvider with ChangeNotifier {
  List<Task> tasks;
  TasksProvider() : this.tasks = [];
  final tasksRef =
      FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
            fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
            toFirestore: (Task, _) => Task.toJson(),
          );

  void addTask(Task newTask) {
    tasks.add(newTask);
    tasksRef.add(newTask);
    notifyListeners();
  }
}
