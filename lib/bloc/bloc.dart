import 'package:bloc/bloc.dart';
import 'package:to_do_today/bloc/event.dart';
import 'package:to_do_today/bloc/state.dart';
import 'package:to_do_today/repository/task_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState>{
  final _taskRepo = TaskRepository();


  TaskBloc() : super(TaskInitialState()) {
    on<LoadTaskEvent>(
        (event, emit) => emit(TaskSuccessState(tasks: _taskRepo.loadTasks()))
    );

    on<AddTaskEvent> (
        (event, emit) => emit(TaskSuccessState(tasks: _taskRepo.addTask(event.task))),

    );

    on<RemoveTaskEvent>(
        (event, emit) => emit(TaskSuccessState(tasks: _taskRepo.removeTask(event.task)))
    );
  }
}