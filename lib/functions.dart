import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_today/repository/task_repository.dart';

// WHERE THE TASK IS SAVE

// Future<File> getFile() async {
//   final directory = await getApplicationDocumentsDirectory();
//   return File("${directory.path}/dados.json");
// }
//
//
// void saveFile() async{
//   final file = await getFile();
//   String data = json.encode(taskList);
//   file.writeAsString(data);
// }
//
// readFile() async {
//   try{
//     final file = await getFile();
//     return file.readAsString();
//   }catch(e){
//     return null;
//   }
//  }

