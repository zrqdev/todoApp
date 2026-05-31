import 'package:flutter/widgets.dart';

class TaskModel with ChangeNotifier {
  final String _text;
  bool _isCheck = false;

  final List<TaskModel> _tasks = [];

  List get allTask {
    return _tasks;
  }

  String get text {
    return _text;
  }

  bool get isCheck {
    return _isCheck;
  }

  void changeIsCheck() {
    _isCheck = !_isCheck;
    notifyListeners();
  }

  void addTask(String text) {
    TaskModel newTask = TaskModel(text: text);
    _tasks.add(newTask);
    notifyListeners();
  }

  TaskModel({required String text}) : _text = text;
}
