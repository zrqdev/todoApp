import 'package:flutter/widgets.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];

  void addTask(String newText) {
    _tasks.add(TaskModel(text: newText));
    notifyListeners();
  }

  List<TaskModel> get allTask {
    return _tasks;
  }

  void changeIsDone(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  bool isDone(int index) {
    return _tasks[index].isDone;
  }

  int get countFinshingTasks {
    return _tasks.where((task) => task.isDone).length;
  }
}





// import 'package:flutter/material.dart';
// import '../data/models/task_model.dart';

// class TodoProvider extends ChangeNotifier {
//   // 1. قائمة المهام (كانت فارغة، وسنضع فيها بيانات وهمية للتجربة حالياً)
//   List<TaskModel> _tasks = [
//     TaskModel(title: "Task 1", isDone: true),
//     TaskModel(title: "Task 2", isDone: false),
//     TaskModel(title: "Task 3", isDone: false),
//   ];

//   // دالة لجلب المهام من الخارج دون التعديل المباشر على القائمة الأساسية
//   List<TaskModel> get tasks => _tasks;

//   // 2. دالة إضافة مهمة جديدة
//   void addTask(String taskTitle) {
//     _tasks.add(TaskModel(title: taskTitle));
//     notifyListeners(); // تنبيه الـ UI لكي يعيد بناء نفسه بالبيانات الجديدة
//   }

//   // 3. دالة لتغيير حالة المهمة (مكتملة أو غير مكتملة) عند الضغط على Checkbox
//   void toggleTaskStatus(int index) {
//     _tasks[index].isDone = !_tasks[index].isDone;
//     notifyListeners(); // تنبيه الـ UI ليتحول المربع لعاملة صح أو العكس
//   }

//   // 4. الحسبة الذكية لعدّ المهام المكتملة (التي فكرت فيها أنت مسبقاً!)
//   int get completedTasksCount {
//     return _tasks.where((task) => task.isDone).length;
//   }
// }

