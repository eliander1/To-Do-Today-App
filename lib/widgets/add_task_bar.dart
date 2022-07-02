import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:to_do_today/bloc/event.dart';
import '../models/task_model.dart';
import '../screens/home.dart';

class AddTaskBar extends StatelessWidget {
  final dateFormat = DateFormat(dd).format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Type a new task here!",
              ),
            ),
          ),
          SizedBox(width: 15),
          ElevatedButton.icon(
            onPressed: () {
              bloc.add(AddTaskEvent(
                  task: Task(
                      task: taskController.text,
                      datetime: DateFormat(dd).format(DateTime.now()))));
              taskController.text = '';

              //TODO bloc save
            },
            icon: Icon(Icons.add),
            label: Text("Add Task"),
          ),
        ],
      ),
    );
  }
}
