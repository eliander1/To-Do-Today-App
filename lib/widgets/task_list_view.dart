import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_today/bloc/bloc.dart';
import '../bloc/state.dart';
import '../screens/home.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskBloc, TaskState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is TaskInitialState) {
            return Center(
                child: const CircularProgressIndicator(),
            );
          } else if (state is TaskSuccessState) {
            final tasksList = state.tasks;

            return ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(DateTime
                        .now()
                        .millisecondsSinceEpoch
                        .toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      //TODO PASSAR UM BLOC AQUI
                      tasksList.removeAt(index);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.blueAccent,
                      child: InkWell(
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 12),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tasksList[index].datetime.toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              tasksList[index].task,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
