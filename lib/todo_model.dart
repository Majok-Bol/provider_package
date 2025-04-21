//it notifies ui of changes
import 'package:flutter/cupertino.dart';

class ToDo with ChangeNotifier{
  List<String>_tasks=[];
  //getter for task
  //make private variable accessible to outside
  List<String>get tasks=>_tasks;
  //function to add task
void addTask(String task){
  _tasks.add(task);
  //notify listeners
  //that there is ui changes
  notifyListeners();
}
void removeTask(int index){
  _tasks.removeAt(index);
  notifyListeners();

}
}