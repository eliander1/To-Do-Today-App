import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:to_do_today/bloc/bloc.dart';
import 'package:to_do_today/repository/task_repository.dart';
import 'package:to_do_today/widgets/task_list_view.dart';
import '../bloc/event.dart';
import '../widgets/add_task_bar.dart';

TextEditingController taskController = TextEditingController();
late final TaskBloc bloc;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    super.initState();
    // readFile().then((data) {
    //   setState(() {
    //      tasks = json.decode(data);
    //   });
    // });
    // readFile();
    bloc = TaskBloc();
    bloc.add(LoadTaskEvent());
    initializeDateFormatting();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        width: double.maxFinite * 0.2,
      ),
      appBar: AppBar(
          title: const Text('To Do Today'),
          backgroundColor: Colors.indigo[900]),
      body: Container(
        decoration: BoxDecoration(color: Colors.indigo[900]),
        child: Column(children: [
          TaskList(),
          AddTaskBar()]),
      ),
    );
  }
}
