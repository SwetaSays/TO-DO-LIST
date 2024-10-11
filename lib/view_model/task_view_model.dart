import 'package:flutter/material.dart';
import 'package:to_do_list/model/task_model.dart';


class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title, status: "Added"));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].status = _tasks[index].status == "Added" ? "Completed" : "Added";
    notifyListeners();
  }
}
