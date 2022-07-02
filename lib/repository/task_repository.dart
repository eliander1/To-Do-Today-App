import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import '../models/task_model.dart';

 List<Task> tasks = [];

class TaskRepository {
  List<Task> loadTasks() {
    tasks.addAll([
      Task(task: 'Arrumar o github',
          datetime: DateFormat(dd).format(DateTime.now())),
    ]);
    return tasks;
  }

  List<Task> addTask(Task task) {
    tasks.add(task);
    //TODO save task in device
    return tasks;
  }

  List<Task> removeTask(Task task) {
    tasks.remove(task);
    return tasks;
  }
}
