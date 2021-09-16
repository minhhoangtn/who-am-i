import 'package:Practice_app/models/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [];

  int get taskCount {
    return taskList.length;
  }

  void addTask(String name) {
    final task = Task(name: name);
    taskList.add(task);
    notifyListeners();
  }

  void toggleCheckBox(int index) {
    taskList[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    taskList.remove(taskList[index]);
    notifyListeners();
  }
}
