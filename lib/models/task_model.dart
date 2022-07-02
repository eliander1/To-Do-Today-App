class Task {
  //final int? id;
  final String task;
  final String datetime;

  Task(
      {
      //this.id = 0,
      required this.datetime,
      required this.task});

  Map<String, dynamic> toMap() {
    return ({
      //'id': id,
      'task': task,
      'creationDate': datetime.toString()
    });
  }
}
